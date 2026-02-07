import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/features/home/domain/entities/categroy_entity.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/category_details_body.dart';
import 'package:grocery/features/home/presentation/widgets/custom_buttom_navigation_bar.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({
    super.key,
    required this.category,
    required this.products,
  });
  final CategroyEntity category;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.lightYellow,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
        leading: IconButton(
          onPressed: () => AppRoutes.router.pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.white),
        ),
      ),
      body: SafeArea(
        child: CategoryDetailsBody(
          categroyEntity: category,
          products: products,
        ),
      ),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
