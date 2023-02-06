import 'package:flutter/material.dart';
import 'package:kiriminaja_test/screens/test.dart';
import 'package:kiriminaja_test/widgets/x_widgets.dart';

import 'example_screen.dart';

class MainHomeScreen extends StatelessWidget {
  static const routeName = 'main_home';
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Home"),
      ),
      body: Column(
        children: [
          const Expanded(flex: 2, child: Widget1()),
          const Divider(color: Colors.black),
          const Expanded(child: Widget2()),
          _buttonGotoExample(context),
        ],
      ),
    );
  }

  // build button go to example screen
  Widget _buttonGotoExample(BuildContext context) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: ElevatedButton(
            child: const Text("Go to example screen"),
            // onPressed: () => Navigator.of(context).pushNamed(ExampleScreen.routeName),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            }),
      );
}
