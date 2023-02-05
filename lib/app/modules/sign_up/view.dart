import 'package:community_managment/app/extensions/image_path_extension.dart';
import 'package:community_managment/app/modules/sign_up/logic.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:community_managment/app/widgets/fade_animation.dart';
import 'package:community_managment/app/widgets/scale_animation.dart';
import 'package:community_managment/app/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignUpView extends GetView<SignUpLogic> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ModalProgressHUD(
        inAsyncCall: controller.isLoading.value,
        progressIndicator: const CircularProgressIndicator(),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: controller.signUpFormKey,
            child: ListView(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('background'.toPng),
                          fit: BoxFit.fill)),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        left: 30,
                        width: 80,
                        height: 200,
                        child: FadeAnimation(
                            1,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'light-1'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        left: 140,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.3,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'light-2'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        right: 40,
                        top: 40,
                        width: 80,
                        height: 150,
                        child: FadeAnimation(
                            1.5,
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    'clock'.toPng,
                                  ),
                                ),
                              ),
                            )),
                      ),
                      Positioned(
                        child: FadeAnimation(
                          1.6,
                          Container(
                            margin: const EdgeInsets.only(top: 50),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(
                          1.8,
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(143, 148, 251, .2),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 10))
                                ]),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                  ),
                                  child: TextInputField(
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hinttext: 'Username',
                                    textInputAction: TextInputAction.next,
                                    editingController:
                                        controller.usernameController,
                                    textInputType: TextInputType.text,
                                    validator:
                                    controller.formValidations?.validation(
                                      type: "text",
                                      multiValidator: MultiValidator([]),
                                      isRequired: true,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade100,
                                      ),
                                    ),
                                  ),
                                  child: TextInputField(
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    hinttext: 'Email',
                                    textInputAction: TextInputAction.next,
                                    editingController:
                                        controller.emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validator:
                                    controller.formValidations?.validation(
                                      type: "email",
                                      multiValidator: MultiValidator([]),
                                      isRequired: true,
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextInputField(
                                    hinttext: 'Password',
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    // maxLines: 1,
                                    contentPadding: const EdgeInsets.only(
                                        top: 10, left: 10),
                                    editingController:
                                        controller.passwordController,
                                    textInputType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
                                    obscureText: controller.obscureText,
                                    onTogglePassword: () =>
                                        controller.togglePassword(),
                                    validator: controller.formValidations
                                        ?.validation(
                                      type: "password",
                                      multiValidator: MultiValidator([]),
                                      isRequired: true,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )),
                      const SizedBox(height: 30),
                      // Card()
                      FadeAnimation(
                        2,
                        InkWell(
                          onTap: () {
                            controller.signUp(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ],
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      FadeAnimation(
                        1.5,
                        CustomAnimatedScale(
                          // onTap: () => Get.back(),
                          onTap: () => Get.offAndToNamed(Routes.SIGN_IN),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                                color: Color.fromRGBO(143, 148, 251, 1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
