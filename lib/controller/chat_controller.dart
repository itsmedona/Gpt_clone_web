import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <String>[].obs;
  var inputMessage = ''.obs;

  void sendMessage() {
    if (inputMessage.value.isNotEmpty) {
      messages.add(inputMessage.value);
      inputMessage.value = '';
    }
  }
}
