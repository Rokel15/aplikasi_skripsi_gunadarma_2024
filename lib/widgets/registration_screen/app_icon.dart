import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  String image;

  AppIcon({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/2.2,
      height: MediaQuery.of(context).size.width/2.2,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: AspectRatio(
          aspectRatio: 1,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}