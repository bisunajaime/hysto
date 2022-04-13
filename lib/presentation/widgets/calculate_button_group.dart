import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:crypto_profit_calculator/presentation/dialogs/general_dialog.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculateButtonGroup extends StatelessWidget {
  const CalculateButtonGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoCubit = context.read<CryptoCubit>();
    final cryptoResultCubit = context.read<CryptoResultCubit>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              cryptoCubit.reset();
            },
            child: Container(
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
          ),
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                if (!cryptoCubit.canSaveRecord) {
                  showDialog(
                      context: context,
                      builder: (context) => GeneralDialog(
                          title: 'There was a problem',
                          content: 'Please fill up all fields before saving.'));
                  return;
                }
                await cryptoResultCubit.saveEntity(cryptoCubit.state, () {
                  cryptoCubit.clear();
                });
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: CPCText(
                    'Save Record',
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
