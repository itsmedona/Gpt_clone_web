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
      QuerySnapshot querySnapshot = await firestore.collection('qnslist').get();
      qnslist.value =
          querySnapshot.docs.map((doc) => doc['name'] as String).toList();
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
