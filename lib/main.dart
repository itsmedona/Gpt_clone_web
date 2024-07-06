import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/auth_controller.dart';
import 'package:gpt_ui/view/screens/login_screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDZMAmhPj3eU65il-0KogYQUj7zKDRSn2k",
      authDomain: "gptcloneweb.firebaseapp.com",
      projectId: "gptcloneweb",
      storageBucket: "gptcloneweb.appspot.com",
      messagingSenderId: "69010420854",
      appId: "1:69010420854:web:8429053866b92a223d9b57",
    ),
  );
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Poe UI Clone',
      theme: ThemeData.dark(),
      home: LoginScreen(),
    );
  }
}
