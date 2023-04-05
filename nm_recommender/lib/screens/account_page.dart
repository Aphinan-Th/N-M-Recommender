import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/providers/auth_provider.dart';
import 'package:nm_recommender/screens/about_page.dart';
import 'package:nm_recommender/screens/contact_page.dart';
import 'package:nm_recommender/screens/setting_page.dart';
import 'package:nm_recommender/screens/suggestion_page.dart';
import 'package:nm_recommender/widgets/avatar.dart';
import 'package:nm_recommender/widgets/button.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.primaryBg,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: title("My Profile"),
          ),
          const ProfilePic(),
          const AccountListInfo(),
          const LogoutButton()
        ],
      ),
    );
  }
}

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: const Avatar(
            radius: 50,
            profileImage: '',
          ),
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, top: 10),
            child: Consumer<AuthProvider>(
              builder: ((context, value, child) {
                value.getUserInfo("6426adeb6ff8bad4e5128b09");
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: text14(value.username),
                    ),
                    body(value.email),
                  ],
                );
              }),
            ))
      ],
    );
  }
}

//Account List Info
class AccountListInfo extends StatefulWidget {
  const AccountListInfo({Key? key}) : super(key: key);

  @override
  State<AccountListInfo> createState() => _AccountListInfoState();
}

class _AccountListInfoState extends State<AccountListInfo> {
  var accountInfo = {
    1: {
      "listName": "Setting",
      "leadingIcon": Icons.settings,
    },
    2: {
      "listName": "About",
      "leadingIcon": Icons.info_outline,
    },
    3: {
      "listName": "Contact",
      "leadingIcon": Icons.contact_mail_sharp,
    }
  };

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: accountInfo.length,
        itemBuilder: (context, index) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: AccountListView(
              num: index + 1,
              info: accountInfo,
            ),
          );
        },
      ),
    );
  }
}

class AccountListView extends StatefulWidget {
  const AccountListView({
    Key? key,
    required int this.num,
    required this.info,
  }) : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<AccountListView> createState() => _AccountListViewState();
}

class _AccountListViewState extends State<AccountListView> {
  late String listName;
  late IconData leadingIcon;

  @override
  void initState() {
    super.initState();
    listName = widget.info[widget.num]["listName"];
    leadingIcon = widget.info[widget.num]["leadingIcon"];
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        listName,
      ),
      contentPadding: const EdgeInsets.only(left: 20, right: 20),
      leading: Icon(
        leadingIcon,
        color: ThemeColor.primary,
        size: 24,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 13,
      ),
      onTap: () => {
        if (listName == "Setting")
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SettingPage()))
          }
        else if (listName == "About")
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AboutPage()))
          }
        else if (listName == "Contact")
          {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ContactPage()))
          }
      },
    );
  }
}

// log out button
class LogoutButton extends StatefulWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Consumer<AuthProvider>(
              builder: ((context, value, child) {
                return Button(
                  buttonName: "Log out",
                  bgColor: ThemeColor.white,
                  width: 333.2,
                  height: 50,
                  callBack: () {
                    value.logout();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SuggestPage()));
                  },
                  textColor: ThemeColor.black,
                );
              }),
            )),
      ],
    );
  }
}
