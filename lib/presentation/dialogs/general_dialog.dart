import 'package:crypto_profit_calculator/presentation/widgets/cpc_text.dart';
import 'package:flutter/material.dart';

class GeneralDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback? onClose;
  const GeneralDialog({
    Key? key,
    required this.title,
    required this.content,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CPCText(
        title,
        fontWeight: FontWeight.w600,
        size: 20,
      ),
      content: CPCText(content),
      actionsAlignment: MainAxisAlignment.end,
      actions: [
        TextButton(
          onPressed: () {
            if (onClose != null) onClose!();
            Navigator.pop(context);
          },
          child: CPCText(
            'Dismiss',
            color: Color.fromARGB(255, 255, 35, 35),
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
