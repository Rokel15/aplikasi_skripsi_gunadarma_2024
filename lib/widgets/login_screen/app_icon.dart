import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  String image;

  AppIcon({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/2.3,
      height: MediaQuery.of(context).size.height*3/10,
      child: AspectRatio(
        aspectRatio: 1,
        child: Image.asset(image, fit: BoxFit.fill,),
      ),
    );
  }
}
