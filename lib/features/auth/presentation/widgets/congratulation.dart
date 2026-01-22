import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/auth/presentation/screens/login_screen.dart';

class Congratulation extends StatelessWidget {
  const Congratulation({super.key, this.callBack});
  final void Function()? callBack;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 461.h,
      width: 333.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.r),
        color: AppColors.lightGray,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [
          Image.asset(
            AppAssets.congratulationImage,
            height: 337.h,
            width: 262.w,
          ),
          verticalSpacing(7),
          CustomSharedButton(
            text: "SIGN IN",
            width: 244.w,
            height: 46.h,
            borderRadius: 23.r,
            textStyle: Styles.semiBold20BlackPoppins.copyWith(
              fontSize: 12.5.sp,
            ),
            onPressed: callBack,

            // callBack;
            // Navigator.push(context, LoginScreen.route());
          ),
          verticalSpacing(63),
        ],
      ),
    );
  }
}
