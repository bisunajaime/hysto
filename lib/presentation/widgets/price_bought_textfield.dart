import 'package:crypto_profit_calculator/presentation/widgets/input_field.dart';
import 'package:flutter/material.dart';

class PriceBoughtTextField extends StatefulWidget {
  const PriceBoughtTextField({Key? key}) : super(key: key);

  @override
  State<PriceBoughtTextField> createState() => _PriceBoughtTextFieldState();
}

class _PriceBoughtTextFieldState extends State<PriceBoughtTextField> {
  TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: 'How much bought (Price in USD)',
      textController: priceController,
    );
  }
}
