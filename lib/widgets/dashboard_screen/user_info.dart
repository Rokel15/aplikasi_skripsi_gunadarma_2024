import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  Color containerColor;
  String profileIcon;
  String email;
  String uid;
  TextStyle emailTextStyle;
  TextStyle uidTextStyle;
  String lat;
  String lon;
  TextStyle latLonTextStyle;

  UserInfo({
    super.key,
    required this.containerColor,
    required this.profileIcon,
    required this.email,
    required this.uid,
    required this.emailTextStyle,
    required this.uidTextStyle,
    required this.lat,
    required this.lon,
    required this.latLonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(24)
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Email : $email", style: emailTextStyle,),
                const SizedBox(height: 10,),
                Text("Uid : $uid,", style: uidTextStyle,),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(14),
            ),
            // child: Text("$lat,$lon"),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (lat == "null" && lon == "null")? "waiting..." : "$lat, $lon",
                  style: latLonTextStyle,
                ),
                GestureDetector(
                  child: Icon(Icons.keyboard_arrow_right),
                  onTap: (){},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}