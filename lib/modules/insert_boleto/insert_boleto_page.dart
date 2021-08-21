import 'package:flutter/material.dart';

class InsertBoletoPage extends StatelessWidget {
  static const String routeName = '/insert_boleto_page';
  const InsertBoletoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Boleto'),
      ),
    );
  }
}
