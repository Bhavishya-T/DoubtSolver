import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController{
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var status = false.obs;

  void changeCheckBoxStatus(status){
    this.status.value=status;
    update();
  }

  void authenticate() async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.value.text,
        password: passwordController.value.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}