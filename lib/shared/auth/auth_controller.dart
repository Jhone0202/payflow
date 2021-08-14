import 'package:flutter/cupertino.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/login/login_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(BuildContext context, UserModel? user) {
    if (user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.routeName, (route) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }
  }

  Future saveUser(UserModel user) async {
    final shared = await SharedPreferences.getInstance();
    await shared.setString('user', user.toJson());
    return;
  }

  Future curretUser(BuildContext context) async {
    final shared = await SharedPreferences.getInstance();
    final json = shared.getString('user');
    if (json != null) {
      setUser(context, UserModel.fromJson(json));
    } else {
      setUser(context, null);
    }
    return;
  }
}
