import 'package:flutter/material.dart';
import 'package:nm_recommender/assets/style.dart';
import 'package:nm_recommender/screens/login_page.dart';
import 'package:nm_recommender/widgets/avatar.dart';
import 'package:nm_recommender/widgets/button.dart';
import 'package:nm_recommender/widgets/navbar.dart';
import '../widgets/text_field.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.white,
      appBar: AppBar(
        backgroundColor: ThemeColor.white,
        elevation: 0,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: ThemeColor.black,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        title: const Text("Sign Up",
        style: TextStyle(color: ThemeColor.black, fontSize: 25),),
      ),
      body: Column(
        children: const [
          EditPicture(),
          DetailInfo(),
          SignUpButton()
        ],
      )
    );
  }
}

// Profile Picture can change function
class EditPicture extends StatefulWidget {
  const EditPicture({Key? key}) : super(key: key);

  @override
  State<EditPicture> createState() => _EditPictureState();
}

class _EditPictureState extends State<EditPicture> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.8, 0.7),
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 10),
          width: 160,
          height: 160,
          child: const Avatar(
            radius: 80,
            profileImage: '',
          ),
        ),
        Container(
          child: const Icon(
            Icons.add_circle,
            color: ThemeColor.black,
          ),
        ),
      ],
    );
  }
}

// detail of 3 Text field
class DetailInfo extends StatefulWidget {
  const DetailInfo({Key? key}) : super(key: key);

  @override
  State<DetailInfo> createState() => _DetailInfoState();
}

class _DetailInfoState extends State<DetailInfo> {
  var detailInfo = {
    1: {
      "headDetail": "Username",
      "hintTextField": "username",
    },
    2: {
      "headDetail": "Email",
      "hintTextField": "email",
    },
    3: {
      "headDetail": "Password",
      "hintTextField": "password",
    },
  };

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    debugPrint(screenW.toString());
    return Container(
      height: 380,
      child: ListView.builder(
        itemCount: detailInfo.length,
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            child: PlatformDetail(
              num: index + 1,
              info: detailInfo,
            ),
          );
        },
      ),
    );
  }
}

// platform detail use for 3 text field
class PlatformDetail extends StatefulWidget {
  const PlatformDetail({Key? key, required int this.num, required this.info,}) : super(key: key);

  final int num;
  final Map<dynamic, dynamic> info;

  @override
  State<PlatformDetail> createState() => _PlatformDetailState();
}

class _PlatformDetailState extends State<PlatformDetail> {
  late String headDetail;
  late String hintTextField;

  @override
  void initState() {
    super.initState();
    headDetail = widget.info[widget.num]["headDetail"];
    hintTextField = widget.info[widget.num]["hintTextField"];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children:[
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 30, bottom: 10, top: 20),
                alignment: Alignment.centerLeft,
                child: Text(headDetail,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                alignment: Alignment.centerLeft,
                child: CreateTextField(
                  hintText: hintTextField,
                  borderColor: ThemeColor.gray,
                  errorBorderColor: ThemeColor.alternate,
                  validation: "-",
                  icon: Icons.clear,
                )
              ),
            ],
          ),
        ]
    );
  }
}

// Button
class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Button(buttonName: "Log in",
      textColor: ThemeColor.black,
      bgColor: ThemeColor.white,
      width: 333.2, height: 50,
      callBack: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Navbar(),),);
      },)
    );
  }
}



