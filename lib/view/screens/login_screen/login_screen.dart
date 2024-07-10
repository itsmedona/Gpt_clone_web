import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/auth_controller.dart';
import 'package:gpt_ui/view/screens/home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find<AuthController>();
    double quarterScreenWidth = MediaQuery.of(context).size.width / 4;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome back',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: quarterScreenWidth,
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email address',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.0,
                        horizontal: 20.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: quarterScreenWidth,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.off(() => HomeScreen());
                    },
                    child: Text('Continue'),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("Don't have an account? Sign Up"),
                SizedBox(height: 10),
                Text("OR"),
                SizedBox(height: 10),
                SizedBox(
                  width: quarterScreenWidth,
                  child: ElevatedButton.icon(
                    onPressed: () => authController.signInWithGoogle(),
                    icon: Icon(Icons.login),
                    label: Text('Continue with Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      side: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
