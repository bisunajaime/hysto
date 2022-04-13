import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WojakAvatarWidget extends StatelessWidget {
  const WojakAvatarWidget({Key? key}) : super(key: key);

  String loadImage(double? profit) {
    if (profit == null) return 'wojak.jpeg';
    if (profit > 0.0) return 'profit.png';
    if (profit < 0.0) return 'loss.png';
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final cryptoCubit = context.watch<CryptoCubit>();
    final assetImage = loadImage(cryptoCubit.state.profit);
    return CircleAvatar(
      backgroundImage: AssetImage('assets/images/$assetImage'),
      radius: 22,
    );
  }
}
