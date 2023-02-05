import 'package:community_managment/app/rest_client/appwrite_client.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  Rx<bool> isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<dynamic> login(BuildContext context) async {
    final user = await AppWriteAuthClient.instance?.login(
        email: emailController.value.text,
        password: passwordController.value.text);
    print("userData");
    print(user.toString());
    if (user != null) {
      isLoading = false.obs;
      Get.offAndToNamed(Routes.HOME);
      print("userData");
      print(user.toString());
    }
  }
// try {
//   final createdUser = await directus.items('directus_users').createOne({
//     'email': '${emailController.value}',
//     'password': '${passwordController.value}'
//   });
//   print(createdUser.toString());
//   if (createdUser != null) {
//     print('Created User ------- ${createdUser.data.toString()}');
//   }
// } catch (e) {
//   print('Error: ${e.toString()}');
// }

}
