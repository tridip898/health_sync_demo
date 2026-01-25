import 'package:get/get.dart';

import '../../../core/utils/toaster.dart';
import '../../../data/model/doctor_model.dart';
import '../../../data/repository/doctor_repository.dart';

class DummyPageController extends GetxController {
  final RxList<String> selectedDoctorIds = <String>[].obs;
  final RxList<DoctorModel> doctorList = <DoctorModel>[].obs;

  final DoctorRepository doctorRepository = DoctorRepository();

  int _page = 1;
  bool _hasMore = true;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    getDoctorList(initialLoad: true, search: '');
  }

  @override
  onInit() {
    super.onInit();
    resetDoctorList();
    getDoctorList(initialLoad: true, search: '');
  }

  Future<void> getDoctorList({
    bool initialLoad = false,
    required String search,
  }) async {
    if (initialLoad) _resetPagination();

    if (!_hasMore || isLoading.value) return;

    isLoading.value = true;

    final response = await doctorRepository.getDoctorList(
      page: _page,
      search: search.trim(),
      limit: 10,
      activeFilter: null,
      specialtyId: [],
      organizationId: null,
    );

    response.fold(
          (e) => Toaster.error(e.message ?? 'Failed'),
          (res) {
        final list = res.data ?? [];

        if (_page == 1) {
          doctorList.value = list;
        } else {
          doctorList.addAll(list);
        }

        _hasMore = (res.meta?.page ?? 1) <
            (res.meta?.totalPages ?? 1);
        _page++;
      },
    );

    isLoading.value = false;
  }


  void _resetPagination() {
    _page = 1;
    _hasMore = true;
    doctorList.clear();
  }

  void resetDoctorList() {
    _resetPagination();
  }

  void onSearchChanged(String value) {
    if (value.trim().isEmpty) {
      // Search clear
      resetDoctorList();
      getDoctorList(initialLoad: true, search: '');
    } else {
      resetDoctorList();
      getDoctorList(initialLoad: true, search: value);
    }
  }

  void removeMedicalId(String id) {
    selectedDoctorIds.remove(id);
  }

  List<DoctorModel> get selectedMedicalModels =>
      doctorList.where((d) => selectedDoctorIds.contains(d.doctorId)).toList();
}
