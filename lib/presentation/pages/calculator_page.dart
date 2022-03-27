import 'package:crypto_profit_calculator/presentation/bloc/crypto_calculator_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:crypto_profit_calculator/presentation/theme/spacing.dart';
import 'package:crypto_profit_calculator/presentation/widgets/calculate_button_group.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:crypto_profit_calculator/presentation/widgets/crypto_result_widget.dart';
import 'package:crypto_profit_calculator/presentation/widgets/history_widget.dart';
import 'package:crypto_profit_calculator/presentation/widgets/input_field.dart';
import 'package:crypto_profit_calculator/presentation/widgets/share_count_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  late CryptoCubit cryptoCubit;
  late CryptoCalculatorCubit cryptoCalculatorCubit;

  @override
  void initState() {
    super.initState();
    cryptoCubit = context.read<CryptoCubit>();
    cryptoCalculatorCubit = context.read<CryptoCalculatorCubit>();

    cryptoCubit.amountBoughtController.addListener(amountBoughtListener);
    cryptoCubit.boughtAtPriceController.addListener(boughtAtPriceListener);
    cryptoCubit.sellPriceController.addListener(sellPriceListener);
  }

  void amountBoughtListener() {
    if (cryptoCubit.amountBoughtController.text.isEmpty) {
      cryptoCubit.updateEntity(
        cryptoCubit.state.copyWith(amountBought: null),
      );
      return;
    }
    final value = double.parse(cryptoCubit.amountBoughtController.text);
    cryptoCubit.updateEntity(
      cryptoCubit.state.copyWith(amountBought: value),
    );
  }

  void boughtAtPriceListener() {
    if (cryptoCubit.boughtAtPriceController.text.isEmpty) {
      cryptoCubit.updateEntity(
        cryptoCubit.state.copyWith(boughtAtPrice: null),
      );
      return;
    }
    final value = double.parse(cryptoCubit.boughtAtPriceController.text);
    cryptoCubit.updateEntity(
      cryptoCubit.state.copyWith(boughtAtPrice: value),
    );
  }

  void sellPriceListener() {
    if (cryptoCubit.sellPriceController.text.isEmpty) {
      cryptoCubit.updateEntity(
        cryptoCubit.state.copyWith(sellPrice: null),
      );
      return;
    }
    final value = double.parse(cryptoCubit.sellPriceController.text);
    cryptoCubit.updateEntity(
      cryptoCubit.state.copyWith(sellPrice: value),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
              Spacing.textFieldOuterSpacing,
              InputField(
                label: 'How much bought (Price in USD)',
                textController: cryptoCubit.amountBoughtController,
              ),
              Spacing.textFieldSpacing,
              InputField(
                label: 'Price of crypto when bought',
                textController: cryptoCubit.boughtAtPriceController,
              ),
              Spacing.textFieldOuterSpacing,
              ShareCountWidget(),
              Spacing.textFieldOuterSpacing,
              InputField(
                label: 'Sell price',
                textController: cryptoCubit.sellPriceController,
              ),
              CryptoResultWidget(),
              CalculateButtonGroup(),
              Spacing.textFieldOuterSpacing,
              HistoryWidget(),
              Spacing.resultComputationSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
