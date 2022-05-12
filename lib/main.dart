import 'package:crypto_profit_calculator/app_setup.dart';
import 'package:crypto_profit_calculator/presentation/pages/calculator_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final appSetup = AppSetup(MyApp());
  await appSetup.setupApp();
  FlutterNativeSplash.remove();
  runApp(appSetup.buildApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hysto',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: CalculatorPage(),
    );
  }
}
