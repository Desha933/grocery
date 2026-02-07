import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/vertical_grid_card_item.dart';

class CustomSliverGridCategroyProduct extends StatelessWidget {
  const CustomSliverGridCategroyProduct({
    super.key,
    this.itemCount,
    this.mainAxisExtent,
    this.products,
  });
  final List<ProductEntity>? products;
  final int? itemCount;
  final double? mainAxisExtent;
  @override
  Widget build(BuildContext context) {
    return products != null
        ? SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 12.w,
                mainAxisExtent: mainAxisExtent ?? 200.h, // 👈 الارتفاع هنا
              ),
              itemCount: products!.length,

              itemBuilder: (context, index) {
                return VerticalGridCardItem(product: products![index]);
              },
            ),
          )
        : const SliverToBoxAdapter();
  }
}
