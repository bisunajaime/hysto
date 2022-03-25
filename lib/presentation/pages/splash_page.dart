import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //  image
            Text('Crypto Profit Calculator'),
            Text('show us your gainz bro'),
          ],
        ),
      ),
    );
  }
}
