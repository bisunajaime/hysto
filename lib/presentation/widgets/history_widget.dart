import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:crypto_profit_calculator/presentation/widgets/crypto_result_widget.dart';
import 'package:flutter/material.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
  }
}

class HistoryListView extends StatelessWidget {
  const HistoryListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, i) => HistoryItem(),
    );
  }
}

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    content: '\$12.00',
                  ),
                  HistoryItemContent(
                    label: 'Crypto price',
                    content: '\$1.00',
                  ),
                  HistoryItemContent(
                    label: 'Sold at',
                    content: '\$2.00',
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
              color: kProfitColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
              child: HistoryItemContent(
                label: 'Sold at',
                content: '\$2.00',
                position: HistoryItemPosition.right,
                color: Colors.white,
              ),
            ),
          )
        ],
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
