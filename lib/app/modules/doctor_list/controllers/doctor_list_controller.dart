import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/custom_dropdown_bottom_sheet.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
import 'package:health_sync_question/app/data/model/organization_response_model.dart';
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
  Rx<bool?> activeFilter = Rx(null);
  Rx<bool> isLoading = false.obs;

  int _pageOrganization = 1;
  bool _hasMoreOrganization = true;
  Rx<bool> isLoadingOrganization = false.obs;

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;

  RxList<OrganizationModel> organizationList = <OrganizationModel>[].obs;
  Rx<OrganizationModel?> selectedOrganization = Rx(null);

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
    super.onClose();
  }

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
      activeFilter: activeFilter.value,
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
      DoctorFilterBottomSheet(
        onOrganizationSelect: onOrganizationSelect,
        onSpecialtySelect: () {},
        organizationNameController: organizationNameController,
        specialtyNameController: specialtyNameController,
      ),
      isScrollControlled: true,
    );
  }

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
    if (_hasMore == false) return;
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
}
