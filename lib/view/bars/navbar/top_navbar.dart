import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gpt_ui/controller/home_controller.dart';

class TopNavBar extends StatelessWidget {
  final HomeController controller = Get.find();
  final TextEditingController questionController = TextEditingController();
  final RxBool isQuestionSubmitted = false.obs;
  final RxString submittedQuestion = ''.obs;
  final RxString activeBot = ''.obs;

  void _handleSubmitQuestion() {
    if (questionController.text.isNotEmpty) {
      submittedQuestion.value = questionController.text;
      controller.addQuestion(submittedQuestion.value);
      questionController.clear();
      isQuestionSubmitted.value = true;
      activeBot.value = 'Claude-3.5-Sonnet';
    }
  }

  Widget buildResponseButton(
      BuildContext context, String botName, IconData icon) {
    return Obx(
      () {
        bool isButtonClicked = activeBot.value == botName;
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          decoration: BoxDecoration(
            color: isButtonClicked ? Colors.green : Colors.grey,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextButton.icon(
            onPressed: () {
              activeBot.value = isButtonClicked ? '' : botName;
            },
            icon: Icon(icon, color: Colors.white),
            label: Text(
              botName,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  Widget buildResponseContainer(String botName, String dialogueText) {
    return FractionallySizedBox(
      widthFactor: 0.5,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.grey,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$botName Response',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              dialogueText,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 2),
          ],
        ),
      ),
    );
  }

  Widget buildChatBubble(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: isUser ? Colors.blue[400] : Colors.grey[200],
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChatGPT Clone'),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: ListView(
                padding: EdgeInsets.all(8.0),
                children: [
                  if (isQuestionSubmitted.value) ...[
                    buildChatBubble(submittedQuestion.value, true),
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              buildResponseButton(
                                context,
                                'Claude-3.5-Sonnet',
                                Icons.library_books,
                              ),
                              buildResponseButton(
                                context,
                                'Gemini',
                                Icons.album,
                              ),
                            ],
                          ),
                          if (activeBot.value == 'Claude-3.5-Sonnet')
                            buildResponseContainer(
                              'Claude-3.5-Sonnet',
                              'You clicked on the Claude-3.5-Sonnet button.',
                            ),
                          if (activeBot.value == 'Gemini')
                            buildResponseContainer(
                              'Gemini',
                              'You clicked on the Gemini button.',
                            ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, -1),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: questionController,
                    decoration: InputDecoration(
                      hintText: 'Enter your question...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16.0,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _handleSubmitQuestion,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
