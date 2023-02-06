import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiriminaja_test/blocs/x_blocs.dart';
import 'package:kiriminaja_test/models/x_models.dart';

class ExampleScreen extends StatelessWidget {
  static const routeName = 'examole_screen';
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Example Screen"),
      ),
      body: BlocBuilder<ExampleBloc, ExampleState>(
        builder: (_, state) {
          if (state is ExampleStateLoading) {
            return _info(context, "loading...");
          }

          if (state is ExampleStateFailed) {
            return _info(context, state.text);
          }

          if (state is ExampleStateLoaded) {
            return _dataWidget(context, state.data);
          }

          return _info(context, "Unknown");
        },
      ),
    );
  }

  // build info message
  Widget _info(BuildContext context, String text) => Center(
        child: Text(text,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center),
      );

  // build data widget
  Widget _dataWidget(BuildContext context, Example data) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Status : ${data.status}"),
            Text("Message : ${data.message}"),
          ],
        ),
      );
}
