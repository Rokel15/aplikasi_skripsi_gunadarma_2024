import 'package:flutter/material.dart';

class RegistrationButton extends StatelessWidget {
  String textButton;
  TextStyle textStyle;
  Color buttonColor;
  Function() onTapRegist;

  RegistrationButton({
    super.key,
    required this.textButton,
    required this.textStyle,
    required this.buttonColor,
    required this.onTapRegist,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 34),
        padding: const EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          color: buttonColor,
        ),
        child: Center(child: Text(textButton, style: textStyle,),),
      ),
      onTap: (){onTapRegist();},
    );
  }
}