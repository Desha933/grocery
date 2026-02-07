import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/features/home/domain/entities/categroy_entity.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(16),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 17.h,
                crossAxisSpacing: 23.w,
              ),
              itemCount: AppSvgAssets.categories.length,
              itemBuilder: (context, index) {
                return VerticalCategoryItem(
                  products: products,
                  categroy: AppSvgAssets.categories[index],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class VerticalCategoryItem extends StatelessWidget {
  const VerticalCategoryItem({
    super.key,
    required this.categroy,
    required this.products,
  });
  final CategroyEntity categroy;
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var list = getCategroyProducts(
          context,
          products,
          categroy.categoryName,
        );
        AppRoutes.router.push(
          AppRoutes.categoryProductsScreen,
          extra: (categroy, list),
        );
      },
      child: Container(
        width: 138.w,
        height: 138.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.lightGray,
        ),
        child: Center(
          child: SvgPicture.asset(
            categroy.categoryImage,
            color: AppColors.orange,
          ),
        ),
      ),
    );
  }

  List<ProductEntity> getCategroyProducts(
    BuildContext context,
    List<ProductEntity> products,
    String ategoryName,
  ) {
    final list = products
        .where((element) => element.categoryName == ategoryName)
        .toList();
    return list;
  }
}
