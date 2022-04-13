import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<CryptoCubit, CryptoResultEntity>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CPCText(
                'Your shares',
                color: Colors.white,
                fontWeight: FontWeight.normal,
                size: 12,
              ),
              SizedBox(height: 4),
              CPCText(
                state.shares?.toStringAsFixed(2) ?? '0',
                fontWeight: FontWeight.w800,
                color: Colors.white,
                size: 20,
              ),
            ],
          );
        },
      ),
    );
  }
}
