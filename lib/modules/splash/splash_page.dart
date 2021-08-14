import 'package:flutter/material.dart';
import 'package:payflow/shared/auth/auth_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  static const String routeName = '/';
  SplashPage({Key? key}) : super(key: key);

  Future _init(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));
    final auth = AuthController();
    auth.curretUser(context);
  }

  @override
  Widget build(BuildContext context) {
    _init(context);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppImages.union),
            Image.asset(AppImages.logoFull),
          ],
        ),
      ),
    );
  }
}
