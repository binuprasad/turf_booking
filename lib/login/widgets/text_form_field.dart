import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_tickets/login/login_home/controller/login_page_controller.dart';

class TextformField extends GetView<LoginPageController> {
  TextformField({
    Key? key,
    required this.text,
    required this.icon,
    required this.validatortxt,
    this.suffixIcon,
    this.eyeicon,
    this.obscure,
    required this.textcontroller
  }) : super(key: key);
  final String text;
  final IconData icon;
  final String validatortxt;
  final bool? eyeicon;
  final Widget? suffixIcon;
  final bool? obscure;
  final TextEditingController textcontroller;

  final loginpagecontroller = Get.put(LoginPageController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller:textcontroller ,
        obscureText: obscure ?? false,
        style: const TextStyle(color: Colors.white),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatortxt;
          }
          return null;
        },
        // obscureText: true ? text='Password':text='Em',
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: Icon(
            icon,
            color: Colors.white,
          ),
          fillColor: Colors.black,
          filled: true,
          hintStyle: const TextStyle(color: Colors.white),
          hintText: text,
  
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.white),
          // ),
          // enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(
          //     color: Colors.lightBlue,
          //   ),
          // ),
        ),
      ),
    );
  }
}
