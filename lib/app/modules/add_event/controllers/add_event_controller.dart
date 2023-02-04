import 'package:appwrite/appwrite.dart';
import 'package:community_managment/app/rest_client/dio_client.dart';
import 'package:community_managment/app/validators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AddEventController extends GetxController {

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final dateTimeController = TextEditingController();
  final typeController = TextEditingController();
  final FormValidations? formValidations;
  final addEventFormKey = GlobalKey<FormState>();
  AddEventController(this.formValidations);

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


Future<void> addEvent() async{
  Client client = Client();
  Databases databases = Databases(client);
  Future result = databases.createDocument(
    databaseId: '63de951884b6784ee7b0',
    collectionId: '63de982bcdb7f21f3bb8',
    documentId: 'unique()',
    data: {
      'name':nameController.text,
      'description':descriptionController.text,
      'date_time':'',
      'type':'',
      'community_id':'',
    },
  );
  if(result!=null){

  }


}}
