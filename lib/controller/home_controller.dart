import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedBot = 'Assistant'.obs;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  var qnslist = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchQnslistData();
  }

  void fetchQnslistData() async {
    try {
      QuerySnapshot querySnapshot = await firestore.collection("qnslist").get();
      qnslist.value = querySnapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        print("Document data: $data"); // Debug statement
        if (data != null && data.containsKey('question')) {
          return data['question'] as String;
        } else {
          print("Document ${doc.id} does not contain 'question' field.");
          return 'No question available';
        }
      }).toList();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
