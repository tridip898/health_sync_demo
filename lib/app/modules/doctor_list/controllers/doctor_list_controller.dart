import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_bottom_sheet.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/data/model/specialty_model.dart';
import 'package:health_sync_question/app/data/model/specialty_model.dart';
import 'package:health_sync_question/app/data/model/specialty_model.dart';
import 'package:health_sync_question/app/data/repository/doctor_repository.dart';
import 'package:health_sync_question/app/data/repository/organization_repository.dart';
import 'package:health_sync_question/app/modules/doctor_list/views/widgets/doctor_filter_bottom_sheet.dart';

class DoctorListController extends GetxController {
  final TextEditingController searchDoctorTextController =
      TextEditingController();
  final TextEditingController organizationNameController =
      TextEditingController();
  final TextEditingController specialtyNameController = TextEditingController();

  final DoctorRepository doctorRepository = DoctorRepository();
  final OrganizationRepository organizationRepository =
      OrganizationRepository();

  int _page = 1;
  bool _hasMore = true;
  Rx<bool> includeNonVerified = Rx(false);
  Rx<bool> isLoading = false.obs;

  int _pageOrganization = 1;
  bool _hasMoreOrganization = true;
  Rx<bool> isLoadingOrganization = false.obs;

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;

  RxList<OrganizationModel> organizationList = <OrganizationModel>[].obs;
  Rx<OrganizationModel?> selectedOrganization = Rx(null);

  RxList<SpecialtyModel> specialtyList = <SpecialtyModel>[].obs;
  Rx<SpecialtyModel?> selectedSpecialty = Rx(null);

  Rx<bool> shouldApplyFilter = false.obs;
  Rx<int> filterCount = 0.obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    getDoctorList(initialLoad: true);
    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.pixels >= position.maxScrollExtent - 100 &&
          isLoading.value == false) {
        getDoctorList();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    searchDoctorTextController.dispose();
    organizationNameController.dispose();
    specialtyNameController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  /// doctor section -----------------------------------------------------------
  getDoctorList({bool initialLoad = false}) async {
    if (initialLoad) {
      _resetPagination();
      Loading.show();
    }
    if (_hasMore == false) return;
    isLoading.value = true;
    final response = await doctorRepository.getDoctorList(
      page: _page,
      search: searchDoctorTextController.text.trim(),
      activeFilter: shouldApplyFilter.value
          ? (includeNonVerified.value ? null : true)
          : true,
      organizationId: shouldApplyFilter.value
          ? selectedOrganization.value?.organizationId
          : null,
      specialtyId: shouldApplyFilter.value
          ? selectedSpecialty.value?.specialtyId
          : null,
    );
    if (initialLoad) {
      Loading.hide();
    }
    response.fold(
      (errorRes) {
        Toaster.error(errorRes.message ?? 'Failed to load doctor list');
      },
      (successRes) {
        doctorList.addAll(successRes.data ?? []);

        final meta = successRes.meta;
        _hasMore = (meta?.page ?? 1) < (meta?.totalPages ?? 1);
        _page++;
      },
    );
    isLoading.value = false;
  }

  _resetPagination() {
    doctorList.clear();
    _page = 1;
    _hasMore = true;
  }

  void onDoctorFilterTap() {
    Get.bottomSheet(
      Obx(() {
        return DoctorFilterBottomSheet(
          onOrganizationSelect: onOrganizationSelect,
          onSpecialtySelect: onSpecialtySelect,
          onOrganizationRemove: _onOrganizationRemove,
          onSpecialtyRemove: _onSpecialtyRemove,
          onApplyFilter: _onApplyFilter,
          onClearFilter: _onClearFilter,
          onIncludeNonVerifiedTap: _onIncludeNonVerifiedTap,
          organizationNameController: organizationNameController,
          specialtyNameController: specialtyNameController,
          includeNonVerified: includeNonVerified.value,
        );
      }),
      isScrollControlled: true,
    );
  }

  /// organization section -----------------------------------------------------
  onOrganizationSelect() async {
    await getOrganizationList(initialLoad: true);
    if (organizationList.isEmpty) return;
    final pickedOrganization = await Get.bottomSheet(
      Obx(() {
        return AppDropdownBottomSheet<OrganizationModel>(
          items: organizationList,
          currentItem: selectedOrganization.value,
          title: 'Organization',
          getTitle: (item) => item.name ?? 'N/A',
          isNetworkSearch: true,
          onReachBottom: (value) {
            getOrganizationList(search: value);
          },
          onSearchSubmit: (value) {
            getOrganizationList(initialLoad: true, search: value);
          },
          moreLoading: isLoadingOrganization.value,
        );
      }),
      isScrollControlled: true,
    );

    if (pickedOrganization != null) {
      selectedOrganization.value = pickedOrganization;
      organizationNameController.text = selectedOrganization.value?.name ?? '';
    }
  }

  getOrganizationList({bool initialLoad = false, String search = ''}) async {
    if (initialLoad) {
      _resetOrganizationPagination();
      Loading.show();
    }
    if (_hasMoreOrganization == false) return;
    isLoadingOrganization.value = true;
    final response = await organizationRepository.getOrganizationList(
      page: _pageOrganization,
      search: search.trim(),
    );
    if (initialLoad) {
      Loading.hide();
    }
    response.fold(
      (errorRes) {
        Toaster.error(errorRes.message ?? 'Failed to load organization list');
      },
      (successRes) {
        organizationList.addAll(successRes.data ?? []);

        final meta = successRes.meta;
        _hasMoreOrganization = (meta?.page ?? 1) < (meta?.totalPages ?? 1);
        _pageOrganization++;
      },
    );
    isLoadingOrganization.value = false;
  }

  _resetOrganizationPagination() {
    organizationList.clear();
    _pageOrganization = 1;
    _hasMoreOrganization = true;
  }

  /// specialty section --------------------------------------------------------
  onSpecialtySelect() async {
    await getSpecialtyList();
    if (specialtyList.isEmpty) return;
    final pickedSpecialty = await Get.bottomSheet(
      Obx(() {
        return AppDropdownBottomSheet<SpecialtyModel>(
          items: specialtyList,
          currentItem: selectedSpecialty.value,
          title: 'Doctor Specialty',
          getTitle: (item) => item.title ?? 'N/A',
          isLocalSearch: true,
        );
      }),
      isScrollControlled: true,
    );

    if (pickedSpecialty != null) {
      selectedSpecialty.value = pickedSpecialty;
      specialtyNameController.text = selectedSpecialty.value?.title ?? '';
    }
  }

  getSpecialtyList() async {
    Loading.show();
    final response = await doctorRepository.getSpecialtyList();
    Loading.hide();

    response.fold(
      (errorRes) {
        Toaster.error(errorRes.message ?? 'Failed to load specialty list');
      },
      (successRes) {
        specialtyList.assignAll(successRes.data ?? []);
      },
    );
  }

  /// filter section -----------------------------------------------------------
  _onOrganizationRemove() {
    selectedOrganization.value = null;
    organizationNameController.clear();
  }

  _onSpecialtyRemove() {
    selectedSpecialty.value = null;
    specialtyNameController.clear();
  }

  _onClearFilter() {
    shouldApplyFilter.value = false;
    _onOrganizationRemove();
    _onSpecialtyRemove();
    includeNonVerified.value = false;
    Get.back();
    getDoctorList(initialLoad: true);
    _getFilterCount();
  }

  _onApplyFilter() {
    shouldApplyFilter.value = true;
    Get.back();
    getDoctorList(initialLoad: true);
    _getFilterCount();
  }

  _onIncludeNonVerifiedTap() {
    includeNonVerified.value = !(includeNonVerified.value);
  }

  _getFilterCount() {
    filterCount.value = 0;
    if (organizationNameController.text.trim().isNotEmpty) {
      filterCount.value++;
    }
    if (specialtyNameController.text.trim().isNotEmpty) {
      filterCount.value++;
    }
    if (includeNonVerified.value) {
      filterCount.value++;
    }
  }
}
