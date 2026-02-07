import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AppSvgAssets.svgList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24.w : 0,
              right: index == AppSvgAssets.svgList.length - 1 ? 24.w : 0,
            ),
            child: CategoryItem(svgImage: AppSvgAssets.svgList[index]),
          );
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.svgImage});
  final String svgImage;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shadowColor: Colors.transparent,

      color: Color(0xffFBFBFB),
      child: Container(
        height: 73.h,
        width: 93.w,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(18.r)),
        child: Center(
          child: SvgPicture.asset(
            width: 40.w,
            height: 40.h,
            svgImage,
            color: AppColors.purple,
          ),
        ),
      ),
    );
  }
}
