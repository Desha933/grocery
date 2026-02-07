
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';

class Reviewers extends StatelessWidget {
  const Reviewers({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 106.w,
          height: 42.h,
          decoration: BoxDecoration(color: AppColors.white),
        ),
        Positioned(
          left: 0,
          child: ReviewerAvatar(image: AppImagesAssets.categroyHomeImage),
        ),
        Positioned(
          left: 32.w,
          child: ReviewerAvatar(image: AppImagesAssets.loginBackGroundImage),
        ),
        Positioned(
          left: 64.w,
          child: ReviewerAvatar(image: AppImagesAssets.registerBackGroundImage),
        ),
      ],
    );
  }
}

class ReviewerAvatar extends StatelessWidget {
  const ReviewerAvatar({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      width: 42.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
