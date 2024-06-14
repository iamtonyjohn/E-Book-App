
import 'package:ebook/Config/Messages.dart';
import 'package:ebook/Pages/Homepage/HomePage.dart';

import 'package:ebook/Pages/WelcomePage/WelcomePage.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  
  RxBool isLoading = false.obs;

  final auth = FirebaseAuth.instance;

  void loginWithEmail() async {
    isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await auth.signInWithCredential(credential);
     successMessage('Login Success');
      Get.offAll(HomePage());
    } catch (ex) {
      print(ex);
   errorMessage('Error! Something went wrong try again');
  }
    isLoading.value = false;
  }

  void signout() async {
    await auth.signOut();
    successMessage('Logout');
    
    Get.offAll(WelcomePage());
  }
}
