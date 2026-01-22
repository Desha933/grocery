import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class CustomSharedButton extends StatelessWidget {
  const CustomSharedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.width,
    this.height,
    this.borderRadius,
  });
  final String text;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 318.w,
        height: height ?? 60.h,
        decoration: BoxDecoration(
          color: AppColors.lightYellow,
          borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
        ),
        child: Center(
          child: Text(text, style: textStyle ?? Styles.bold18Black),
        ),
      ),
    );
  }
}
