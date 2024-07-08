import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/home_controller.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();

    return Container(
      width: 250.0,
      color: Colors.grey[900],
      child: Obx(
        () => ListView.builder(
          itemCount: controller.qnslist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                controller.qnslist[index],
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
