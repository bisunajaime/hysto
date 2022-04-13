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

final _formKey = GlobalKey<FormState>();

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoCubit = context.read<CryptoCubit>();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: RefreshIndicator(
            onRefresh: () async {
              // refresh cache
              await context.read<CryptoResultCubit>().retrieveHistory();
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
      ),
    );
  }
}
