import 'package:flutter/material.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/loginPage';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.4,
              color: AppColors.primary,
            ),
            SafeArea(
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(
                    AppImages.person,
                    width: 208,
                    height: 300,
                  ),
                  const Spacer(),
                  Image.asset(AppImages.logomini),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: Text(
                      'Organize seus boletos em um só lugar',
                      style: AppTextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  SocialLoginButton(
                    press: () => controller.googleSignIn(context),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
