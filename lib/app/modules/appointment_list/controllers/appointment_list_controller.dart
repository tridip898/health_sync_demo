import 'package:get/get.dart';
import 'package:health_sync_question/app/core/utils/toaster.dart';
import 'package:health_sync_question/app/core/widgets/loading.dart';
import 'package:health_sync_question/app/data/model/appointment_list_response_model.dart';
import 'package:health_sync_question/app/data/repository/appointment_repository.dart';

class AppointmentListController extends GetxController {
  int _page = 1;
  bool _hasMore = true;
  Rx<bool> includeNonVerified = Rx(false);
  Rx<bool> isLoading = false.obs;

  final AppointmentRepository appointmentRepository = AppointmentRepository();

  RxList<AppointmentModel> appointmentList = <AppointmentModel>[].obs;

  @override
  onReady() {
    getAppointmentList(initialLoad: true);
    super.onReady();
  }

  getAppointmentList({bool initialLoad = false}) async {
    if (initialLoad) {
      _resetPagination();
      Loading.show();
    }
    if (_hasMore == false) return;
    isLoading.value = true;
    final response = await appointmentRepository.getAppointmentList(
      page: _page,
    );
    if (initialLoad) {
      Loading.hide();
    }
    response.fold(
      (errorRes) {
        Toaster.error(errorRes.message ?? 'Failed to load doctor list');
      },
      (successRes) {
        appointmentList.addAll(successRes.data ?? []);

        final meta = successRes.meta;
        _hasMore = (meta?.page ?? 1) < (meta?.totalPages ?? 1);
        _page++;
      },
    );
    isLoading.value = false;
  }

  _resetPagination() {
    appointmentList.clear();
    _page = 1;
    _hasMore = true;
  }
}
