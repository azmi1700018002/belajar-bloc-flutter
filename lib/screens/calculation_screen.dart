import 'package:flutter/material.dart';
import 'package:kiriminaja_test/widgets/x_widgets.dart';

class CalculationScreen extends StatelessWidget {
  static const routeName = 'calculation_screen';
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculation")),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: [
          const CalculationForm(),
          Container(
              height: 3,
              margin: const EdgeInsets.symmetric(vertical: 15.0),
              color: Colors.black),
          const CalculationResult()
        ],
      ),
    );
  }
}
