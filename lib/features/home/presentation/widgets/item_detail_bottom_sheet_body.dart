import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/tab_actions_and_result.dart';
import 'package:grocery/features/home/presentation/widgets/item_reviewers.dart';
import 'package:grocery/features/home/presentation/widgets/price_and_controlled_value.dart';

class ItemDetailBottomSheetBody extends StatelessWidget {
  const ItemDetailBottomSheetBody({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpacing(16),
          Text(
            product.categoryName,
            style: Styles.semiBold20BlackPoppins.copyWith(fontSize: 14.sp),
          ),
          Text(
            product.name,
            style: Styles.medium18WhitePoppins.copyWith(
              fontSize: 24.sp,
              color: AppColors.black,
            ),
          ),
          verticalSpacing(7),
          PriceAndControlledValue(product: product),
          verticalSpacing(28),
          Row(
            children: [
              Icon(Icons.star, color: AppColors.lightYellow),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "4.5",
                  style: Styles.medium18WhitePoppins.copyWith(
                    color: AppColors.black,
                  ),
                ),
              ),
              Text(
                "(128 reviews)",
                style: Styles.regular16Gray.copyWith(fontSize: 14.sp),
              ),
              Spacer(),
              Reviewers(),
            ],
          ),
          verticalSpacing(28),
          TabActionsAndResult(),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 93.w,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Icon(Icons.favorite, color: AppColors.white),
                  ),
                ),
                Spacer(),
                CustomSharedButton(
                  text: "Add to cart",
                  width: 206.w,
                  height: 60.h,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          verticalSpacing(6),
        ],
      ),
    );
  }
}
