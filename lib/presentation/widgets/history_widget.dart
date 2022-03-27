import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:crypto_profit_calculator/presentation/widgets/crypto_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CryptoResultCubit, Map<String, CryptoResultEntity>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return Container();
        }
        return SizedBox(
          height: 250,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CPCText('History', size: 20, fontWeight: FontWeight.w800),
              Expanded(child: HistoryListView()),
            ],
          ),
        );
      },
    );
  }
}

class HistoryListView extends StatelessWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoResultCubit = context.watch<CryptoResultCubit>();
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: cryptoResultCubit.keys.length,
      itemBuilder: (context, i) {
        final key = cryptoResultCubit.keys[i];
        return HistoryItem(cryptoResultCubit.state[key]!);
      },
    );
  }
}

class HistoryItem extends StatelessWidget {
  final CryptoResultEntity entity;
  const HistoryItem(this.entity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoCubit = context.read<CryptoCubit>();
    return GestureDetector(
      onTap: () {
        cryptoCubit.setEntity(entity);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.black.withOpacity(.05),
              offset: Offset(0, 9),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HistoryItemContent(
                      label: 'Bought this amount',
                      content: '\$${entity.amountBought}',
                    ),
                    HistoryItemContent(
                      label: 'Crypto price',
                      content: '\$${entity.boughtAtPrice}',
                    ),
                    HistoryItemContent(
                      label: 'Sold at',
                      content: '\$${entity.sellPrice}',
                    ),
                    SizedBox(height: 2),
                    CPCText(
                      'some date time',
                      fontWeight: FontWeight.normal,
                      size: 8,
                      color: Colors.black,
                      maxLines: 1,
                      fontStyle: FontStyle.italic,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: entity.didProfit ? kProfitColor : kLossColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                child: HistoryItemContent(
                  label: 'Profit/Loss',
                  content: '\$${entity.profit}',
                  position: HistoryItemPosition.right,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum HistoryItemPosition {
  left,
  right,
}

class HistoryItemContent extends StatelessWidget {
  final String label;
  final String content;
  final HistoryItemPosition position;
  final Color? color;
  const HistoryItemContent(
      {Key? key,
      required this.label,
      required this.content,
      this.position = HistoryItemPosition.left,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: position == HistoryItemPosition.left
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end,
      children: [
        CPCText(
          label,
          fontWeight: FontWeight.normal,
          size: 10,
          color: color ?? Colors.black,
          maxLines: 1,
        ),
        CPCText(
          content,
          fontWeight: FontWeight.w600,
          size: 16,
          color: color ?? Colors.black,
          maxLines: 1,
        ),
      ],
    );
  }
}
