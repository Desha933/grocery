import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/on_boarding/presentation/widgets/scroll_indicator.dart';

class OnBoardingSecondScreen extends StatelessWidget {
  const OnBoardingSecondScreen({super.key});
  final int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: AppColors.orange, size: 24.sp),
        ),
        backgroundColor: AppColors.lightGray,
        elevation: 0,
      ),
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpacing(50),
            Image.asset(
              AppImagesAssets.onBoardingGroceryImage,
              height: 360.h,
              width: MediaQuery.sizeOf(context).width,
            ),
            Text(
              'We provide best quality Fruits to your family',
              style: Styles.bold24Black,
              textAlign: TextAlign.center,
            ),

            verticalSpacing(34),
            Opacity(
              opacity: 0.7,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed  ',
                style: Styles.light14black,
                textAlign: TextAlign.center,
              ),
            ),
            verticalSpacing(24),
            ScrollIndicator(index: index),
            verticalSpacing(40),
            CustomSharedButton(
              text: 'NEXT',
              onPressed: () {
                context.go(AppRoutes.onBoardingDeliveryScreen);
              },
            ),
            Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}
