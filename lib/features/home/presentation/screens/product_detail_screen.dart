import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/custom_buttom_navigation_bar.dart';
import 'package:grocery/features/home/presentation/widgets/item_detail_bottom_sheet_body.dart';
import 'package:grocery/features/home/presentation/widgets/product_details_image_back_ground_image.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: SafeArea(
        child: ProductDetailsImageBackGroundImage(image: product.image),
      ),
      bottomSheet: Container(
        height: 500.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r),
            topRight: Radius.circular(20.r),
          ),
        ),
        child: ItemDetailBottomSheetBody(product: product),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
