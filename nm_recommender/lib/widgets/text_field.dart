import 'package:flutter/material.dart';

class CreateTextField extends StatefulWidget {
  final String hintText;
  final Color borderColor;
  final Color errorBorderColor;
  final String validation;

  const CreateTextField(
      {Key? key,
      required this.hintText,
      required this.borderColor,
      required this.errorBorderColor,
      required this.validation})
      : super(key: key);

  @override
  State<CreateTextField> createState() => _CreateTextFieldState();
}

class _CreateTextFieldState extends State<CreateTextField> {
  final _formKey = GlobalKey<FormState>();
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              controller: fieldText,
              decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 14.0),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: widget.borderColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: widget.borderColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: widget.errorBorderColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1.0, color: widget.errorBorderColor),
                      borderRadius: BorderRadius.circular(20.0)),
                  suffixIcon: GestureDetector(
                      child: const Icon(Icons.clear),
                      onTap: () {
                        debugPrint("Click!!");
                        clearText();
                      })),
              validator: (value) {
                if (value != widget.validation) {
                  return 'Username or Password is wrong';
                } else {
                  return null;
                }
              }),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('-')));
              }
            },
            child: const Text('Submit'),
          )
        ]));
  }
}
