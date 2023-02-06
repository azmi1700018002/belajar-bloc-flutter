import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiriminaja_test/blocs/example/calculation_bloc.dart';
import 'package:kiriminaja_test/blocs/example/users_event.dart';
import 'package:kiriminaja_test/blocs/example/network_bloc.dart';
import 'package:kiriminaja_test/cubits/x_cubits.dart';
import 'package:kiriminaja_test/repositories/example_repository.dart';
import 'package:kiriminaja_test/repositories/users_repository.dart';
import 'package:kiriminaja_test/screens/main_home_screen.dart';
// ignore: library_prefixes
import 'package:kiriminaja_test/helper/injector.dart' as Injector;
import 'blocs/example/users_bloc.dart';
import 'blocs/x_blocs.dart';
import 'screens/calculation_screen.dart';
import 'screens/example_screen.dart';
import 'screens/photos_screen.dart';

void main() {
  Injector.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KiriminAja Test',
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blue,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        )),
        colorScheme: const ColorScheme.light(
          primary: Colors.blue,
        ),
        disabledColor: Colors.blue,
      ),
      initialRoute: MainHomeScreen.routeName,
      routes: _router,
    );
  }

  // routes of this app
  Map<String, WidgetBuilder> get _router => {
        MainHomeScreen.routeName: (_) => BlocProvider(
            create: (context) => CounterCubit(), child: const MainHomeScreen()),
        PhotosScreen.routeName: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<UserBloc>(
                  create: (context) => UserBloc(
                    UserRepository(),
                  )..add(LoadUserEvent()),
                ),
                BlocProvider<NetworkBloc>(
                  create: (BuildContext context) =>
                      Injector.sLocator<NetworkBloc>(),
                ),
              ],
              child: const PhotosScreen(),
            ),
        CalculationScreen.routeName: (_) => BlocProvider(
              create: (context) => CalculationBloc(),
              child: const CalculationScreen(),
            ),
        ExampleScreen.routeName: (_) => BlocProvider(
              create: (_) =>
                  ExampleBloc(ExampleRepository())..add(ExampleEventLoadData()),
              child: const ExampleScreen(),
            ),
      };
}
