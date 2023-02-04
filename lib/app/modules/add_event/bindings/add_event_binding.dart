import 'package:community_managment/app/modules/add_event/controllers/add_event_controller.dart';
import 'package:community_managment/app/rest_client/dio_client.dart';
import 'package:community_managment/app/validators.dart';
import 'package:get/get.dart';


class AddEventBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEventController>(
      () => AddEventController(FormValidations()),
    );
  }
}
