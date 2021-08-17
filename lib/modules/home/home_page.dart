import 'package:flutter/material.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          alignment: Alignment.center,
          color: AppColors.primary,
          child: ListTile(
            title: Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: AppTextStyles.titleRegular.copyWith(
                  color: AppColors.shape,
                ),
                children: [
                  TextSpan(
                    text: 'Maicon',
                    style: AppTextStyles.titleBoldBackground,
                  )
                ],
              ),
            ),
            subtitle: Text(
              'Mantenha suas contas em dia',
              style: AppTextStyles.captionShape,
            ),
            trailing: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      ),
      body: pages[controller.curretIndex],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: AppColors.primary),
              onPressed: () => setState(() => controller.setPage(0)),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                BarcodeScannerPage.routeName,
              ),
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:
                    Icon(Icons.add_box_outlined, color: AppColors.background),
              ),
            ),
            IconButton(
              icon: Icon(Icons.description_outlined, color: AppColors.body),
              onPressed: () => setState(() => controller.setPage(1)),
            ),
          ],
        ),
      ),
    );
  }
}
