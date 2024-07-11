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
      child: Column(
        children: [
          // Heading with Icons and Text
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.grey[850],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.history, color: Colors.white),
                Text(
                  'History',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
          // Divider
          Divider(color: Colors.grey),
          // ListView for the questions
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
