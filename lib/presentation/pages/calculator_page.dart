import 'package:crypto_profit_calculator/presentation/widgets/calculate_button_group.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:crypto_profit_calculator/presentation/widgets/crypto_result_widget.dart';
import 'package:crypto_profit_calculator/presentation/widgets/history_widget.dart';
import 'package:crypto_profit_calculator/presentation/widgets/input_field.dart';
import 'package:crypto_profit_calculator/presentation/widgets/share_count_widget.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController priceController = TextEditingController();

  SizedBox get textFieldSpacing => SizedBox(height: 12);
  SizedBox get textFieldOuterSpacing => SizedBox(height: 23);
  SizedBox get resultComputationSpacing => SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            // refresh cache
          },
          child: ListView(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: MediaQuery.of(context).padding.top + 24,
            ),
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/wojak.jpeg'),
                    radius: 22,
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CPCText(
                        'Calculate your gainz',
                        fontWeight: FontWeight.w800,
                        size: 18,
                      ),
                      CPCText(
                        'to the moon 🚀',
                        fontWeight: FontWeight.w400,
                        size: 14,
                      ),
                    ],
                  ),
                ],
              ),
              textFieldOuterSpacing,
              InputField(
                label: 'How much bought (Price in USD)',
                textController: priceController,
              ),
              textFieldSpacing,
              InputField(
                label: 'Price of crypto when bought',
                textController: priceController,
              ),
              textFieldOuterSpacing,
              ShareCountWidget(),
              textFieldOuterSpacing,
              InputField(
                label: 'Sell price',
                textController: priceController,
              ),
              resultComputationSpacing,
              CryptoResultWidget(100.00),
              resultComputationSpacing,
              CalculateButtonGroup(),
              textFieldOuterSpacing,
              HistoryWidget(),
              resultComputationSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
