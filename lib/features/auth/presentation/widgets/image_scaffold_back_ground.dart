import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';

class ImageScaffoldBackGround extends StatelessWidget {
  const ImageScaffoldBackGround({super.key, required this.image, this.email});
  final String image;
  final String? email;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(image, fit: BoxFit.cover),
        Positioned(
          top: 30.h,
          left: 20.w,
          child: IconButton(
            onPressed: () => email == null
                ? AppRoutes.router.pop()
                : showSnackBar(
                    context,
                    "You Are Already Registered Continue To Home",
                  ),
            icon: Icon(Icons.arrow_back, color: AppColors.white, size: 24.sp),
          ),
        ),
      ],
    );
  }
}
