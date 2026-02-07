import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/categroy_entity.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/custom_search_field.dart';
import 'package:grocery/features/home/presentation/widgets/custom_sliver_grid_category_product.dart';

class CategoryDetailsBody extends StatelessWidget {
  const CategoryDetailsBody({
    super.key,
    required this.products,
    required this.categroyEntity,
  });

  final List<ProductEntity> products;
  final CategroyEntity categroyEntity;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            decoration: BoxDecoration(color: AppColors.lightYellow),
            child: Padding(
              padding: EdgeInsets.only(left: 28.h, bottom: 26.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${categroyEntity.categoryName} Category",
                    style: Styles.semiBold20BlackPoppins,
                  ),
                  Text(
                    "${products.length ?? 0} Items",
                    style: Styles.regular15BlackDMSans.copyWith(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        SliverToBoxAdapter(child: Clipper()),
        SliverToBoxAdapter(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            decoration: BoxDecoration(color: AppColors.white),
            child: CustomSearchField(),
          ),
        ),

        products.isNotEmpty
            ? CustomSliverGridCategroyProduct(products: products)
            : SliverToBoxAdapter(child: Center(child: Text("No Products"))),
      ],
    );
  }
}

class Clipper extends StatelessWidget {
  const Clipper({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 20.h,
          decoration: BoxDecoration(color: AppColors.lightYellow),
        ),
        Positioned(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 20.h,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.r),
                topRight: Radius.circular(20.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
