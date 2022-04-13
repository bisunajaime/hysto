import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/theme/spacing.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const kProfitColor = Color(0xff228153);
const kLossColor = Color(0xffC83F3F);

class CryptoResultWidget extends StatelessWidget {
  const CryptoResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoCubit, CryptoResultEntity>(
        builder: (context, state) {
      if (state.profit == null) {
        return Spacing.textFieldOuterSpacing;
      }

      final didProfit = state.profit != null && state.profit! > 0;
      final resultText = didProfit ? 'profit' : 'loss';
      final resultColor = didProfit ? kProfitColor : kLossColor;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacing.resultComputationSpacing,
          Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: resultColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/$resultText.png',
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  resultColor.withOpacity(.3),
                  BlendMode.dstATop,
                ),
              ),
            ),
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CPCText(
                  'Your $resultText (USD)',
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  size: 16,
                ),
                SizedBox(height: 4),
                CPCText(
                  '${state.profit?.toStringAsFixed(2)}',
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  size: 28,
                ),
              ],
            ),
          ),
          Spacing.resultComputationSpacing,
        ],
      );
    });
  }
}
