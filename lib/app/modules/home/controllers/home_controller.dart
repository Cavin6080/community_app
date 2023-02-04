import 'package:community_managment/app/rest_client/dio_client.dart';
import 'package:get/get.dart';


class HomeController extends GetxController {
  late final RestClient client;

  //TODO: Implement HomeController

  final count = 0.obs;

  HomeController(this.client);

  @override
  void onInit() {
    super.onInit();
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
