import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reon_task/view/styles/color.dart';

class AppsFonts {
  static final appbarText = GoogleFonts.roboto(
    fontSize: 16.sp,
  );
  static final headlineFonts = GoogleFonts.roboto(
      fontSize: 17.sp, fontWeight: FontWeight.bold, color: black);
  static final sublineFonts =
      GoogleFonts.roboto(fontSize: 17.sp, fontWeight: FontWeight.w400);
  static final lebelLightFont = GoogleFonts.roboto(
      fontSize: 17.sp, fontWeight: FontWeight.w400, color: grey);
}
