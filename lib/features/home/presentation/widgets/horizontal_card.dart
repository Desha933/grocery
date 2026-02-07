import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class HorizontalCard extends StatelessWidget {
  const HorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: AppColors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Stack(
        children: [
          Container(
            height: 162.h,
            width: 263.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesAssets.categroyHomeImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            bottom: 21.h,
            left: 20.w,
            child: Text(
              'Recomended \nRecipe Today',
              style: Styles.semiBold20BlackPoppins.copyWith(
                color: AppColors.white,
                fontSize: 16.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
