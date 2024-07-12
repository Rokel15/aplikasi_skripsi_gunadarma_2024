import 'package:flutter/material.dart';

class FormRegistrationInput extends StatelessWidget {
  TextEditingController textEditingController;
  bool obscureText;
  String hintLabel;
  String hintText;
  Icon suffixIcon;
  Function() onTapSuffixIcon;
  Color borderColor;

  FormRegistrationInput({
    super.key,
    required this.textEditingController,
    required this.obscureText,
    required this.hintLabel,
    required this.hintText,
    required this.suffixIcon,
    required this.onTapSuffixIcon,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      child: TextFormField(
        controller: textEditingController,
        obscureText: obscureText,
        decoration: InputDecoration(
          label: Text(hintLabel),
          hintText: hintText,
          suffixIcon: GestureDetector(
            child: suffixIcon,
            onTap : (){onTapSuffixIcon();},
          ),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(18),),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(18),),
            borderSide: BorderSide(color: borderColor, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(18),),
            borderSide: BorderSide(color: borderColor,width: 2),
          ),
        ),
      ),
    );
  }
}