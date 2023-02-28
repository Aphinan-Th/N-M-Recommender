import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/about_page.dart';
import 'package:nm_recommender/screens/contact_page.dart';
import 'package:nm_recommender/screens/setting_page.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ThemeColor.primaryBg,
        title: const Text("My Profile", style: TextStyle(color: ThemeColor.black),),
      ),
      body: AccountListInfo(),
    );
  }
}

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
    return Container(
      height: 300,
      child: ListView.builder(
        itemCount: accountInfo.length,
        itemBuilder: (context, index) {
          return Container(
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
  const AccountListView({Key? key, required int this.num, required this.info,}) : super(key: key);

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
    return ListTile(title: Text(listName,),
          leading: Icon(leadingIcon, color: ThemeColor.primary, size: 24,),
          trailing: const Icon(Icons.arrow_forward_ios, size: 13,),
          onTap: () =>
          {
            if (listName == "Setting") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SettingPage()))
            } else
              if (listName == "About") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutPage()))
              } else
                if (listName == "Contact") {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const ContactPage()))
                }
          },
    );
  }
}




