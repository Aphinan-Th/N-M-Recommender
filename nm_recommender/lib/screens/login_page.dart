import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nm_recommender/screens/sign_up.dart';
import 'package:nm_recommender/screens/suggestion_page.dart';
import 'package:nm_recommender/widgets/avatar.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import '../assets/style.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';
import 'google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryBg,
          elevation: 0,
          leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
              color: ThemeColor.black,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const SuggestPage())); //Welcome Page
            },
          ),
          title: text24('Login'),
        ),
        body: SingleChildScrollView(
            child: Material(
                color: ThemeColor.primaryBg,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const Avatar(
                              radius: 75,
                              profileImage:
                                  'https://static.trueplookpanya.com/tppy/member/m_545000_547500/545994/cms/images/2019-Q3/%E0%B9%81%E0%B8%A1%E0%B8%A79%E0%B8%8A%E0%B8%B5%E0%B8%A7%E0%B8%B4%E0%B8%95.jpg'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: text14('N&M Recommender'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CreateTextField(
                            hintText: 'Username',
                            borderColor: ThemeColor.gray,
                            errorBorderColor: ThemeColor.alternate,
                            validation: '-',
                            icon: Icons.clear,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CreateTextField(
                              hintText: 'Password',
                              borderColor: ThemeColor.gray,
                              errorBorderColor: ThemeColor.alternate,
                              validation: '-',
                              icon: Icons.clear,
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
                                      value: value,
                                      onChanged: (value) {
                                        setState(() {
                                          this.value = value!;
                                        });
                                      },
                                      activeColor: ThemeColor.primary,
                                    )),
                                textgw60014('Remember me')
                              ]),
                              GestureDetector(
                                child: textaw60014('FORGOT PASSWORD?   '),
                                onTap: () {
                                  Navigator.pop(
                                      context); // go to forgot pass page !!!!!
                                },
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 16.0),
                          child: Button(
                            // useIcon: const Icon(null),
                            buttonName: 'Login',
                            bgColor: ThemeColor.white,
                            width: 300,
                            height: 50,
                            callBack: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Navbar()));
                            },
                            textColor: ThemeColor.black,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Button(
                            // useIcon: const Icon(null),
                            buttonName: 'Register',
                            bgColor: ThemeColor.primary,
                            width: 300,
                            height: 50,
                            callBack: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
                            textColor: ThemeColor.white,
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(bottom: 24.0),
                            child: or('OR')),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: Button(
                            // useIcon: const Icon(Icons.abc),
                            icon: const NetworkImage("https://icons8.com/icon/17949/google"),
                            buttonName: 'Sign in with Google',
                            bgColor: ThemeColor.white,
                            width: 230,
                            height: 44,
                            callBack: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignInDemo()));
                            },
                            textColor: ThemeColor.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
