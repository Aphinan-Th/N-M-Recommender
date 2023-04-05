import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/providers/auth_provider.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'button.dart';

class LoginForm extends StatefulWidget {
  final Color borderColor;
  final Color errorBorderColor;
  const LoginForm({
    Key? key,
    required this.borderColor,
    required this.errorBorderColor,
  }) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String _email = '';
  String _password = '';

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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "email",
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.0,
                ),
                enabledBorder: outlineInputBorder(widget.borderColor),
                focusedBorder: outlineInputBorder(widget.borderColor),
                errorBorder: outlineInputBorder(widget.errorBorderColor),
                focusedErrorBorder: outlineInputBorder(widget.errorBorderColor),
                suffixIcon: GestureDetector(
                  onTap: () => setState(() {
                    _email = "";
                  }),
                  child: const Icon(Icons.clear),
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your email";
                }
                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return "Please enter a valid email";
                }
                return null;
              },
              onSaved: (value) {
                _email = value!;
              },
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "password",
                  hintStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.0,
                  ),
                  enabledBorder: outlineInputBorder(widget.borderColor),
                  focusedBorder: outlineInputBorder(widget.borderColor),
                  errorBorder: outlineInputBorder(widget.errorBorderColor),
                  focusedErrorBorder:
                      outlineInputBorder(widget.errorBorderColor),
                  suffixIcon: GestureDetector(
                    onTap: () => setState(() {}),
                    child: const Icon(Icons.clear),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              )),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisSize: MainAxisSize.max, children: [
                  Theme(
                      data: ThemeData(
                          checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ))),
                      child: Checkbox(
                        value: remember,
                        onChanged: (value) {
                          setState(() {
                            remember = value!;
                          });
                        },
                        activeColor: ThemeColor.primary,
                      )),
                  textgw60014('Remember me')
                ]),
                GestureDetector(
                  child: textaw60014('FORGOT PASSWORD?   '),
                  onTap: () {
                    Navigator.pop(context); // go to forgot pass page !!!!!
                  },
                )
              ],
            ),
          ),
          Consumer<AuthProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.only(top: 12.0, bottom: 16.0),
                child: Button(
                  buttonName: 'Login',
                  bgColor: ThemeColor.white,
                  width: 300,
                  height: 50,
                  callBack: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    }
                    value.login(_email, _password);
                    if (value.token != "") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Navbar()));
                    }
                  },
                  textColor: ThemeColor.black,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
