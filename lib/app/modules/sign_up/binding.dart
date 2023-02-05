import 'package:community_managment/app/validators.dart';
import 'package:get/get.dart';

import 'logic.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpLogic(FormValidations()));
  }
}
