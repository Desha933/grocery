import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/on_boarding/presentation/widgets/scroll_indicator.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});
  final int index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(56),
        Image.asset(
          AppImagesAssets.onBoardingGroceryImage,
          height: 360.h,
          width: MediaQuery.sizeOf(context).width,
        ),
        Text('Welcome to Fresh Fruits', style: Styles.bold24Black),
        Text('Grocery application', style: Styles.bold18Black),
        verticalSpacing(34),
        Opacity(
          opacity: 0.7,
          child: Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor ',
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
            AppRoutes.router.push(AppRoutes.onBoardingSecondScreen);
          },
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
