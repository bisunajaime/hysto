import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';

class ShareCountWidget extends StatelessWidget {
  const ShareCountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 23,
        vertical: 13,
      ),
      width: double.infinity,
      color: Colors.black,
      child: CPCText(
        '100,000 Shares',
        fontWeight: FontWeight.w800,
        color: Colors.white,
      ),
    );
  }
}
