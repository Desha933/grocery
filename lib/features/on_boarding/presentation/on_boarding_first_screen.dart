import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/features/on_boarding/presentation/widgets/on_boarding_body.dart';

class OnBoardingFirstScreen extends StatelessWidget {
  const OnBoardingFirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: AppColors.orange, size: 24.sp),
        ),
        backgroundColor: AppColors.lightGray,
        elevation: 0,
      ),
      backgroundColor: Color(0xffFBFBFB),
      body: SafeArea(child: OnBoardingBody()),
    );
  }
}
