import 'package:appwrite/appwrite.dart';
import 'package:community_managment/app/helpers.dart';
import 'package:community_managment/app/rest_client/appwrite_client.dart';
import 'package:community_managment/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;
  set isLoading(value) => _isLoading.value = value;
  final _isParticle = false.obs;
  get isParticle => _isParticle.value;
  set isParticle(value) => _isParticle.value = value;

  ProfileController();

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

  Future<void> getProfile() async {
    Client client = Client();
    Databases databases = Databases(client);
    Future result = databases.getDocument(
      databaseId: '63de951884b6784ee7b0',
      collectionId: '63de982bcdb7f21f3bb8',
      documentId: 'unique()',
    );
    if (result != null) {}
  }

  logout(BuildContext context) async {
    try {
      isLoading = true;
      await AppWriteAuthClient.instance?.logout();

      isLoading = false;
      Get.offAllNamed(Routes.SIGN_IN);
    } catch (e) {
      print(e.toString());
      getSnackBar(
        "Something went wrong, please try again",
        SNACK.FAILED,
      );
    }
  }
}
