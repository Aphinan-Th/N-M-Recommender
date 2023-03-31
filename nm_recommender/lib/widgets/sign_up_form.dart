import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/providers/auth_provider.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import 'package:provider/provider.dart';
import 'button.dart';

class SignUpForm extends StatefulWidget {
  final Color borderColor;
  final Color errorBorderColor;
  const SignUpForm({
    Key? key,
    required this.borderColor,
    required this.errorBorderColor,
  }) : super(key: key);
  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  bool remember = false;
  String _username = '';
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
        child: Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Username",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "username",
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
                      onTap: () => setState(() {
                        _username = "";
                      }),
                      child: const Icon(Icons.clear),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your username";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
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
                    focusedErrorBorder:
                        outlineInputBorder(widget.errorBorderColor),
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
              Container(
                margin: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "Password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30),
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
              Consumer<AuthProvider>(
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 40, bottom: 16.0),
                    child: Button(
                      buttonName: 'SignUp',
                      bgColor: ThemeColor.white,
                      width: 300,
                      height: 50,
                      callBack: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                        value.signUp(_username, _email, _password);
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
        ));
  }
}
