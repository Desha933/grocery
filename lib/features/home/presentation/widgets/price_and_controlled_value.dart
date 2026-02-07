import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';

class PriceAndControlledValue extends StatelessWidget {
  const PriceAndControlledValue({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "${product.price}",
          style: Styles.medium18WhitePoppins.copyWith(
            fontSize: 24.sp,
            color: AppColors.lightYellow,
          ),
        ),
        Container(
          // width: 113.w,
          height: 35.h,
          decoration: BoxDecoration(
            color: Color(0xffEFEFEF),
            borderRadius: BorderRadius.circular(18.r),
          ),
          child: Row(
            // spacing: 10.w,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove,
                    size: 24.sp,
                    color: AppColors.lightYellow,
                  ),
                ),
              ),
              Text(
                "1",
                style: Styles.medium18WhitePoppins.copyWith(
                  fontSize: 20.sp,
                  color: AppColors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add,
                    size: 24.sp,
                    color: AppColors.lightYellow,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
