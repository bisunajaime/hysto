import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WojakImageWidget extends StatelessWidget {
  const WojakImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoCubit, CryptoResultEntity>(
        builder: (context, state) {
      final didProfit = state.profit != null && state.profit! > 0;
      final imageResult = didProfit ? 'profit' : 'loss';
      if (state.profit == null) return Container();
      return SizedBox(
        width: double.infinity,
        height: 250,
        child: Image.asset(
          'assets/images/$imageResult.png',
          fit: BoxFit.cover,
        ),
      );
    });
  }
}
