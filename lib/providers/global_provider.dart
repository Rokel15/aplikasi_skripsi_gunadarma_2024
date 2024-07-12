import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GlobalProvider extends ChangeNotifier{
  Color mainColor = const Color(0xff448E75);
  String appIcon = "images/app_icon.png";

  TextStyle roboto14Italic = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400,);
  TextStyle roboto14 = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w500,);
  TextStyle roboto14SemiBold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w600,);
  TextStyle roboto14Bold = GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700,);

  TextStyle roboto16Italic = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400,);
  TextStyle roboto16 = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w500,);
  TextStyle roboto16SemiBold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w600,);
  TextStyle roboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700,);

  TextStyle whiteRoboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white);
  TextStyle greenRoboto16Bold = GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.green[900]);
}