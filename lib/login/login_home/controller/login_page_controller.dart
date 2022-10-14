import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginPageController extends GetxController{
  final emailcontroller = TextEditingController();
  final  passwordcontroller = TextEditingController();
    final formKey =  GlobalKey<FormState>();
    RxBool isobscure=false.obs;

    
    buttonclickValidator(){
       if (formKey.currentState!.validate()) {
     Get.snackbar('Processing data ', 'data is processing');
  
    }

   
    }
}