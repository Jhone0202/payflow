import 'package:flutter/material.dart';

import 'package:payflow/modules/extrato/extrato_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/homePage';
  final UserModel user;
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final boletoController = BoletoListController();
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
                    text: widget.user.name,
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
                image: DecorationImage(
                  image: NetworkImage(widget.user.photoUrl ?? ''),
                ),
              ),
            ),
          ),
        ),
      ),
      body: [
        MeusBoletosPage(controller: boletoController),
        ExtratoPage(),
      ][controller.curretIndex],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: controller.curretIndex == 0
                    ? AppColors.primary
                    : AppColors.body,
              ),
              onPressed: () => setState(() => controller.setPage(0)),
            ),
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, InsertBoletoPage.routeName);
                boletoController.getBoletos();
                setState(() {});
              },
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
              icon: Icon(
                Icons.description_outlined,
                color: controller.curretIndex == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
              onPressed: () => setState(() => controller.setPage(1)),
            ),
          ],
        ),
      ),
    );
  }
}
