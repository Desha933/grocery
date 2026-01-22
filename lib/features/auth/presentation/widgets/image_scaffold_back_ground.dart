import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';

class ImageScaffoldBackGround extends StatelessWidget {
  const ImageScaffoldBackGround({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Positioned(
          top: 30.h,
          left: 20.w,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: AppColors.white, size: 24.sp),
          ),
        ),
      ],
    );
  }
}
