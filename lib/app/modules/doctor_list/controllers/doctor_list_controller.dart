import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/doctor_list_response_model.dart';
import 'package:health_sync_question/app/data/repository/doctor_repository.dart';

class DoctorListController extends GetxController {
  final TextEditingController searchDoctorTextController =
      TextEditingController();

  final DoctorRepository doctorRepository = DoctorRepository();

  int _page = 1;
  bool _hasMore = true;
  Rx<bool?> activeFilter = Rx(null);
  Rx<bool> isLoading = false.obs;

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;

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
}
