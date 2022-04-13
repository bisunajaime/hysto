import 'package:flutter/material.dart';

const kTextFieldFillColor = Color.fromARGB(255, 238, 238, 238);
const kTextFieldHintColor = Color.fromARGB(255, 182, 182, 182);

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController textController;
  final bool isLast;
  const InputField({
    Key? key,
    required this.label,
    required this.textController,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      keyboardType: TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      textInputAction: isLast ? TextInputAction.done : TextInputAction.next,
      decoration: InputDecoration(
          filled: true,
          fillColor: kTextFieldFillColor,
          hintText: label,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 24,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
          )),
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
