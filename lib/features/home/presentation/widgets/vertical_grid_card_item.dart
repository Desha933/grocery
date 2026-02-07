import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';

class VerticalGridCardItem extends StatelessWidget {
  const VerticalGridCardItem({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AppRoutes.router.push(AppRoutes.productDetailsScreen, extra: product),
      child: Card(
        shadowColor: AppColors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Stack(
          children: [
            Container(
              height: 199.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(product.image),

                  fit: BoxFit.fill,
                ),
              ),
            ),

            Positioned(
              top: 14.h,
              left: 5.w,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite, color: AppColors.white),
              ),
            ),
            Positioned(
              bottom: 14.h,
              left: 10.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Avocado', style: Styles.medium18WhitePoppins),
                  verticalSpacing(6),
                  Text(r'$6.7', style: Styles.bold14WhitePoppins),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
