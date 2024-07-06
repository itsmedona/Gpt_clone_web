import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          children: [
            Icon(Icons.align_horizontal_left_rounded, color: Colors.white),
            SizedBox(width: 8.0),
            Text(
              'Chat GPT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.help_outline, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    'What can I help you with?',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 9,
            child: Obx(() {
              return ListView.builder(
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      chatController.messages[index],
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.attach_file_outlined, color: Colors.white),
                SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      chatController.inputMessage.value = value;
                    },
                    controller: TextEditingController(
                        text: chatController.inputMessage.value),
                    decoration: InputDecoration(
                      hintText: 'Enter your message',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.white),
                  onPressed: chatController.sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
