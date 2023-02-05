import 'package:appwrite/appwrite.dart';
import 'package:community_managment/app/rest_client/appwrite_client.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:community_managment/app/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpLogic extends GetxController {
  Rx<bool> isLoading = false.obs;
  final _obscureText = true.obs;

  SignUpLogic(this.formValidations);
  set obscureText(value) => _obscureText.value = value;
  get obscureText => _obscureText.value;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FormValidations? formValidations;
  final signUpFormKey = GlobalKey<FormState>();




  Future<void> signUp(BuildContext context) async {
    if(signUpFormKey.currentState!.validate()){
    try {
      isLoading = true.obs;
      final user = AppWriteAuthClient.instance?.signup(userID: 'unique()', name: usernameController.value.text, email: emailController.value.text, password: passwordController.value.text);
      if(user!=null){
            user.then((value) => print("user ---- ${value.toString()}"));
          }
      final userData = await user;
      isLoading = false.obs;
      Get.offAndToNamed(Routes.HOME);
      print(userData);
    } on AppwriteException catch (error){
      print(error);
      Get.snackbar("","$error");
    }
    catch (e) {
      print(e);
    }}
  }

  void togglePassword(){
    obscureText = !obscureText;
  }
}
