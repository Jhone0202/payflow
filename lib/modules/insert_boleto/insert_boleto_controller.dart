import 'package:flutter/cupertino.dart';

class InsertBoletoController {
  final formKey = GlobalKey<FormState>();

  String? validadeName(String? value) =>
      value?.isEmpty ?? true ? 'O nome não pode ser vazio' : null;

  String? validadeVencimento(String? value) =>
      value?.isEmpty ?? true ? 'Informe a data de vencimento do boleto' : null;

  String? validadeValor(double value) =>
      value == 0 ? 'Insira um valor maior que R\$0,00' : null;

  String? validadeCodigo(String? value) =>
      value?.isEmpty ?? true ? 'Informe o código do boleto' : null;

  void onChange({String? name, String? dueDate, double? valor, String? cod}) {}

  void cadastrarBoleto() {
    final form = formKey.currentState;
    if (form!.validate()) {}
  }
}
