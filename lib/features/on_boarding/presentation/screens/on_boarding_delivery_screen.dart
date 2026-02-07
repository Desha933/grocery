import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/on_boarding/presentation/widgets/login_and_register_button.dart';
import 'package:grocery/features/on_boarding/presentation/widgets/scroll_indicator.dart';

class OnBoardingDeliveryScreen extends StatelessWidget {
  const OnBoardingDeliveryScreen({super.key});
  final int index = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Image.asset(
                AppImagesAssets.onBoardingDeliveryImage,
                height: 360.h,
                width: MediaQuery.sizeOf(context).width,
              ),
              Expanded(child: SizedBox()),
              Text(
                'Fast and responsibily delivery by our courir ',
                style: Styles.bold24Black,
                textAlign: TextAlign.center,
              ),
              verticalSpacing(14),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor  ',
                style: Styles.light14black,
                textAlign: TextAlign.center,
              ),
              verticalSpacing(24),
              ScrollIndicator(index: index),
              verticalSpacing(40),
              LoginAndRegisterButton(
                onPressed: () =>
                    AppRoutes.router.push(AppRoutes.registerScreen),
                text: 'Create an account',
              ),
              verticalSpacing(18),
              LoginAndRegisterButton(
                onPressed: () {
                  AppRoutes.router.push(AppRoutes.loginScreen);
                },
                text: 'Login',
              ),
              verticalSpacing(18),
            ],
          ),
        ),
      ),
    );
  }
}
