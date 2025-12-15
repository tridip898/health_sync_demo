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
  Rx<bool> activeFilter = Rx(false);

  RxList<DoctorModel> doctorList = <DoctorModel>[].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onReady() {
    getDoctorList(initialLoad: true);
    scrollController.addListener(() {
      final position = scrollController.position;

      if (position.pixels >= position.maxScrollExtent - 100) {
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
    if (_hasMore == false) return;
    if (initialLoad) {
      _resetPagination();
      Loading.show();
    }
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
        if (_page == 1) doctorList.clear();
        doctorList.addAll(successRes.data ?? []);

        final meta = successRes.meta;
        _hasMore = (meta?.page ?? 1) < (meta?.totalPages ?? 1);
      },
    );
  }

  _resetPagination() {
    _page = 1;
    _hasMore = true;
    activeFilter.value = false;
  }
}
