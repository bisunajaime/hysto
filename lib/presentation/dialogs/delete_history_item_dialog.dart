import 'package:crypto_profit_calculator/presentation/dialogs/general_dialog.dart';
import 'package:flutter/material.dart';

class DeleteHistoryItemDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  const DeleteHistoryItemDialog(this.onConfirm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GeneralDialog(
      title: 'Confirmation',
      content: 'Are you sure you want to delete this record?',
      onConfirm: onConfirm,
    );
  }
}
