import 'package:flutter/material.dart';
import 'package:nm_recommender/providers/auth_provider.dart';
import 'package:nm_recommender/screens/sign_up.dart';
import 'package:nm_recommender/screens/suggestion_page.dart';
import 'package:nm_recommender/widgets/avatar.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import 'package:provider/provider.dart';
import '../assets/style.dart';
import '../widgets/button.dart';
import '../widgets/login_form.dart';
import 'google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool value = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

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
                        const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: LoginForm(
                            borderColor: ThemeColor.gray,
                            errorBorderColor: ThemeColor.alternate,
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
                            icon: const NetworkImage(
                                "https://icons8.com/icon/17949/google"),
                            buttonName: 'Sign in with Google',
                            bgColor: ThemeColor.white,
                            width: 230,
                            height: 44,
                            callBack: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignInDemo()));
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
