import 'package:flutter/material.dart';
import 'package:gpt_ui/view/bars/navbar/top_navbar.dart';
import 'package:gpt_ui/view/bars/sidebar/sidebar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Flexible(
            child: TopNavBar(),
          ),
        ],
      ),
    );
  }
}
