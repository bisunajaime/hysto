import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';

const kProfitColor = Color(0xff228153);
const kLossColor = Color(0xffC83F3F);

class CryptoResultWidget extends StatelessWidget {
  final double result;
  const CryptoResultWidget(this.result, {Key? key}) : super(key: key);

  bool get didProfit => result > 0;
  String get resultText => didProfit ? 'Profit' : 'Loss';
  Color get resultColor => didProfit ? kProfitColor : kLossColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(34),
      decoration: BoxDecoration(
        color: resultColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: CPCText(
        '${result.toStringAsFixed(2)} USD $resultText',
        color: Colors.white,
        fontWeight: FontWeight.w900,
        size: 22,
      ),
    );
  }
}
