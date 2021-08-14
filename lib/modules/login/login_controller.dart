import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  Future googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final res = await _googleSignIn.signIn();
      if (res != null) {
        final user = UserModel(name: res.displayName!, photoUrl: res.photoUrl);
        authController.setUser(context, user);
      }
    } catch (error) {
      print(error);
    }
  }
}
