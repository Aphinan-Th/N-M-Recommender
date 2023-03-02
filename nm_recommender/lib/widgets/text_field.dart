import 'package:flutter/material.dart';

class CreateTextField extends StatefulWidget {
  final String hintText;
  final Color borderColor;
  final Color errorBorderColor;
  final String validation;
  final IconData icon;
  final int? maxLines;

  const CreateTextField({
    Key? key,
    required this.hintText,
    required this.borderColor,
    required this.errorBorderColor,
    required this.validation,
    required this.icon,
    this.maxLines,
  }) : super(key: key);

  @override
  State<CreateTextField> createState() => _CreateTextFieldState();
}

class _CreateTextFieldState extends State<CreateTextField> {
  final _formKey = GlobalKey<FormState>();
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  OutlineInputBorder outlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(width: 1.0, color: color),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        maxLength: widget.maxLines,
        controller: fieldText,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
          ),
          enabledBorder: outlineInputBorder(widget.borderColor),
          focusedBorder: outlineInputBorder(widget.borderColor),
          errorBorder: outlineInputBorder(widget.errorBorderColor),
          focusedErrorBorder: outlineInputBorder(widget.errorBorderColor),
          suffixIcon: GestureDetector(
            onTap: clearText,
            child: Icon(widget.icon),
          ),
        ),
        validator: (value) {
          if (value != widget.validation) {
            return 'Username or Password is wrong';
          } else {
            return null;
          }
        },
      ),
    );
  }
}
