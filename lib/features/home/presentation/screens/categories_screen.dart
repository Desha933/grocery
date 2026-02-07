import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/domain/entities/product_entity.dart';
import 'package:grocery/features/home/presentation/widgets/categories.dart';
import 'package:grocery/features/home/presentation/widgets/custom_buttom_navigation_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGray2,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.white,
        title: Text("Categories", style: Styles.semiBold20BlackPoppins),
        leading: IconButton(
          onPressed: () => AppRoutes.router.pop(),
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(child: Categories(products: products)),
      bottomNavigationBar: CustomButtomNavigationBar(),
    );
  }
}
