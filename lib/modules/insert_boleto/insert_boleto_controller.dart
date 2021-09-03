import 'package:flutter/cupertino.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();
  BoletoModel model = BoletoModel();

  String? validadeName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;

  String? validadeVencimento(String? value) =>
      value?.isEmpty ?? true ? 'Informe a data de vencimento do boleto' : null;

  String? validadeValor(double value) =>
      value == 0 ? 'Insira um valor maior que R\$0,00' : null;

  String? validadeCodigo(String? value) =>
      value?.isEmpty ?? true ? 'Informe o código do boleto' : null;

  void onChange({String? name, String? dueDate, double? value, String? cod}) {
    model = model.copyWith(
      name: name,
      dueDate: dueDate,
      value: value,
      barcode: cod,
    );
  }

  Future<void> saveBoleto() async {
    final shared = await SharedPreferences.getInstance();
    final boletos = shared.getStringList('boletos') ?? <String>[];
    boletos.add(model.toJson());
    await shared.setStringList('boletos', boletos);
    return;
  }

  Future<void> cadastrarBoleto() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return await saveBoleto();
    }
  }
}
