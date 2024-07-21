import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  String profileIcon;
  String email;
  String uid;
  TextStyle emailTextStyle;
  TextStyle uidTextStyle;

  UserData({
    super.key,
    required this.profileIcon,
    required this.email,
    required this.uid,
    required this.emailTextStyle,
    required this.uidTextStyle
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).orientation == Orientation.portrait?
          MediaQuery.of(context).size.width/2.5 : MediaQuery.of(context).size.height/2.5,
          child: Image.asset(
            profileIcon,
            fit: BoxFit.fill,
          ),
        ),

        const SizedBox(height: 20,),

        Container(
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green,
          ),
          child: Column(
            children: [
              Text(email, style: emailTextStyle,),

              const SizedBox(height: 10,),

              Text(uid, style: uidTextStyle,),
            ],
          ),
        ),
      ],
    );
  }
}