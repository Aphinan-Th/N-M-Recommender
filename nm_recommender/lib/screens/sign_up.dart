import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: DetailInfo(),
    );
  }
}

//
class EditPicture extends StatefulWidget {
  const EditPicture({Key? key}) : super(key: key);

  @override
  State<EditPicture> createState() => _EditPictureState();
}

class _EditPictureState extends State<EditPicture> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

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
      height: 500,
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
                margin: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                child: Text(headDetail,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.centerLeft,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: hintTextField,
                  ),
                ),
              ),
            ],
          ),
        ]
    );
  }
}


