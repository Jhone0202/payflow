import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';
import 'package:animated_card/animated_card.dart';

class MeusBoletosPage extends StatefulWidget {
  const MeusBoletosPage({Key? key}) : super(key: key);

  @override
  _MeusBoletosPageState createState() => _MeusBoletosPageState();
}

class _MeusBoletosPageState extends State<MeusBoletosPage> {
  final controller = BoletoListController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                height: 40,
                color: AppColors.primary,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ValueListenableBuilder<List<BoletoModel>>(
                  valueListenable: controller.boletosNotifier,
                  builder: (_, boleto, __) => AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfoWidget(
                      size: boleto.length,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meus Boletos',
                  style: AppTextStyles.titleBoldHeading,
                ),
                const SizedBox(height: 24),
                Divider(
                  thickness: 1,
                  height: 1,
                  color: AppColors.stroke,
                ),
                const SizedBox(height: 24),
                BoletoListWidget(controller: controller),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
