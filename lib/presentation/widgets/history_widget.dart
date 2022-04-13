import 'package:crypto_profit_calculator/domain/entities/crypto_result_entity.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_cubit.dart';
import 'package:crypto_profit_calculator/presentation/bloc/crypto_result_cubit.dart';
import 'package:crypto_profit_calculator/presentation/dialogs/delete_history_item_dialog.dart';
import 'package:crypto_profit_calculator/presentation/theme/ui_helper.dart';
import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:crypto_profit_calculator/presentation/widgets/crypto_result_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyboardOpened = isKeyboardOpen(context);
    return BlocBuilder<CryptoResultCubit, CryptoResultState>(
      builder: (context, state) {
        if (state is CryptoResultUpdated) {
          if (state.results.isEmpty) return Container();
          return SizedBox(
            height: keyboardOpened ? 79 : 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                keyboardOpened
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: CPCText(
                          'History',
                          size: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                Expanded(
                    child: HistoryListView(
                  history: state.results,
                )),
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class HistoryListView extends StatelessWidget {
  final Map<String, CryptoResultEntity> history;
  const HistoryListView({Key? key, required this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: history.keys.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        final key = history.keys.toList().reversed.toList()[i];
        return HistoryItem(history[key]!, i == 0, i == history.keys.length - 1);
      },
    );
  }
}

class HistoryItem extends StatelessWidget {
  final CryptoResultEntity entity;
  final bool isFirst, isLast;
  const HistoryItem(this.entity, this.isFirst, this.isLast, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cryptoCubit = context.read<CryptoCubit>();
    final cryptoResultCubit = context.read<CryptoResultCubit>();
    final isEditing = cryptoCubit.isEditingRecord(entity.id!);
    final textColor = isEditing ? Colors.white : Colors.black;
    final keyboardOpened = isKeyboardOpen(context);
    return GestureDetector(
      onTap: () {
        cryptoCubit.setEntity(entity);
      },
      onLongPress: () async {
        // show dialog and confirm deletion
        showDialog(
          context: context,
          builder: (context) => DeleteHistoryItemDialog(() async {
            // delete record
            await cryptoResultCubit.removeEntity(entity);
          }),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
            left: isFirst ? 16 : 8,
            right: isLast ? 16 : 8,
            top: 16,
            bottom: 16),
        width: 150,
        decoration: BoxDecoration(
          color: isEditing ? Colors.black : Colors.white,
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
            keyboardOpened
                ? Container()
                : Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HistoryItemContent(
                            label: 'Bought this amount',
                            content: '\$${entity.amountBought}',
                            color: textColor,
                          ),
                          HistoryItemContent(
                            label: 'Crypto price',
                            content: '\$${entity.boughtAtPrice}',
                            color: textColor,
                          ),
                          HistoryItemContent(
                            label: 'Sold at',
                            content: '\$${entity.sellPrice}',
                            color: textColor,
                          ),
                          SizedBox(height: 2),
                          CPCText(
                            'some date time',
                            fontWeight: FontWeight.normal,
                            size: 8,
                            color: textColor,
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
                  topRight: keyboardOpened ? Radius.circular(10) : Radius.zero,
                  topLeft: keyboardOpened ? Radius.circular(10) : Radius.zero,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
                child: HistoryItemContent(
                  label: 'Profit/Loss',
                  content: '\$${entity.profit?.toStringAsFixed(2)}',
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
