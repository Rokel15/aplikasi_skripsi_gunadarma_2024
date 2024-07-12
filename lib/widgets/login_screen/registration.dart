import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  String registOfferText;
  String textForRegist;
  TextStyle textStyle;
  TextStyle registerTextStyle;
  Function() onTapTextForRegist;

  Registration({
    super.key,
    required this.registOfferText,
    required this.textForRegist,
    required this.textStyle,
    required this.registerTextStyle,
    required this.onTapTextForRegist,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(registOfferText, style: textStyle,),
        GestureDetector(
          child: Text(textForRegist, style: registerTextStyle,),
          onTap: () => onTapTextForRegist(),
        ),
      ],
    );
  }
}