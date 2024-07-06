import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/home_controller.dart';
import 'package:gpt_ui/view/bars/navbar/top_navbar.dart';
import 'package:gpt_ui/view/bars/sidebar/sidebar.dart';
//import 'package:gpt_ui/view/widgets/chat_area.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Flexible(
            child: TopNavBar(),
          )
        ],
      ),
    );
  }
}
