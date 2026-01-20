import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class LoginAndRegisterButton extends StatelessWidget {
  const LoginAndRegisterButton({
    super.key,
    required this.onPressed,
    required this.text,
  });
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.h,
        width: 318.w,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 3),
          borderRadius: BorderRadius.circular(30.r),
          color: text == 'Login' ? AppColors.white : AppColors.black,
        ),
        child: Center(
          child: Text(
            text,
            style: text == 'Login'
                ? Styles.bold16Black
                : Styles.bold16Black.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}
