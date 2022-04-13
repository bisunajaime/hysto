import 'package:crypto_profit_calculator/app_setup.dart';
import 'package:crypto_profit_calculator/presentation/pages/calculator_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appSetup = AppSetup(MyApp());
  await appSetup.setupApp();
  runApp(appSetup.buildApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
      ),
      home: CalculatorPage(),
    );
  }
}
