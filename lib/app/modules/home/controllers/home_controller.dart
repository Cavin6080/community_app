import 'package:community_managment/app/rest_client/dio_client.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  late final RestClient client;
  late final AnimationController animationController;
  late final Animation<double> animation;

  //TODO: Implement HomeController

  final count = 0.obs;

  HomeController(this.client);

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

}
Future<void> addUsers() async{
  // final result = await client.dio()!.post('/users', data: {
  // "first_name": "Cavin",
  // "last_name": "Macwan",
  // "email": "cavinmacwan1@gmail.com",
  // "password": "milan@99"
  // });
  //   print(result!=null);
  // if(result!=null){
  //   print(result.toString());
  // }
}
