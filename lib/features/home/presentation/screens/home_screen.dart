import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/home/presentation/widgets/custom_buttom_navigation_bar.dart';
import 'package:grocery/features/home/presentation/widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: user.email == "mostafafarar2030@gmail.com"
          ? FloatingActionButton(
              onPressed: () => {
                AppRoutes.router.push(AppRoutes.addProductScreen),
              },

              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: CustomButtomNavigationBar(),
      backgroundColor: AppColors.white,
      body: SafeArea(child: HomeScreenBody(user: user)),
    );
  }
}
