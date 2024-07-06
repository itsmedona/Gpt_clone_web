import 'package:flutter/material.dart';

class ChatArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[900],
      child: Center(
        child: Text('Chat Area',
            style: TextStyle(color: Colors.white, fontSize: 24)),
      ),
    );
  }
}
