import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controllers/login_page_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginPageController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    style: BorderStyle.none,
                    color: Colors.blue
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                contentPadding: EdgeInsets.all(5.0),
                fillColor: Colors.blue,
                errorText: "Wrong Email Entered",
                hintText: "Enter your Email",
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white24,
                  textBaseline: TextBaseline.ideographic
                ),
                errorStyle: TextStyle(color: Colors.white),

              ),
              controller: controller.emailController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                contentPadding: EdgeInsets.all(5.0),
                fillColor: Colors.blue,
                errorText: "Wrong Password Entered",
                errorStyle: TextStyle(color: Colors.white),
                hintText: "Enter your Password",
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white24,
                  textBaseline: TextBaseline.alphabetic
                ),
              ),
              controller: controller.passwordController,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                child: const Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () => {},
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  GetX<LoginPageController>(
                    builder: (_) => Checkbox(
                      checkColor: Colors.blue,
                      fillColor: MaterialStateProperty.all(Colors.white),
                      value: controller.status.value,
                      onChanged: (val) => controller.changeCheckBoxStatus(val),
                    ),
                  ),
                  const Text(
                    "Remember Me?",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                controller.authenticate();
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                    Size.copy(const Size(350.0, 40.0))),
                backgroundColor:
                    const MaterialStatePropertyAll<Color>(Colors.white),
                elevation: MaterialStateProperty.all(3.0),
              ),
              child: const Text(
                "SUBMIT",
                style: TextStyle(color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "OR",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "Sign in with",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
