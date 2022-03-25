import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';

class CalculateButtonGroup extends StatelessWidget {
  const CalculateButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          child: Icon(
            Icons.clear,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: CPCText(
                'Calculate',
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
