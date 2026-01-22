import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_font_weight.dart';

abstract class Styles {
  static TextStyle bold24Black = TextStyle(
    fontSize: 24.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );
  static TextStyle bold18Black = TextStyle(
    fontSize: 18.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );

  static TextStyle bold16Black = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.bold,
    color: AppColors.black,
  );
  static TextStyle semiBold20BlackPoppins = TextStyle(
    fontFamily: GoogleFonts.poppins().fontFamily,
    fontSize: 20.sp,
    fontWeight: AppFontWeight.semiBold,
    color: AppColors.black,
  );
  static TextStyle light14black = TextStyle(
    fontSize: 14.sp,
    fontWeight: AppFontWeight.light,
    color: AppColors.black,
  );
  static TextStyle regular15BlackDMSans = TextStyle(
    fontFamily: GoogleFonts.dmSans().fontFamily,
    fontSize: 15.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.black,
  );
  static TextStyle regular16Gray = TextStyle(
    fontSize: 16.sp,
    fontWeight: AppFontWeight.regular,
    color: AppColors.gray,
  );
}
