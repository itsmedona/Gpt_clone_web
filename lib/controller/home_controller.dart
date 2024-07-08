import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedBot = 'Assistant'.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<String> qnslist = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadQuestions();
  }

  Future<void> addQuestion(String question) async {
    await firestore.collection('qnslist').add({
      'question': question,
      'timestamp': FieldValue.serverTimestamp(),
    });
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    QuerySnapshot querySnapshot = await firestore
        .collection('qnslist')
        .orderBy('timestamp', descending: true)
        .get();
    qnslist.value =
        querySnapshot.docs.map((doc) => doc['question'] as String).toList();
  }
}
