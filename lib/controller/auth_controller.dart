import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gpt_ui/view/screens/home_screen/home_screen.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User?> _firebaseUser = Rxn<User?>();

  User? get user => _firebaseUser.value;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);

      if (_auth.currentUser?.email != null) {
        Get.offAll(HomeScreen());
      } else {
        Get.snackbar(
            'Success', 'Signed in as ${_auth.currentUser?.displayName}');
      }
    } catch (error) {
      Get.snackbar('Error', 'Failed to sign in: $error');
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
