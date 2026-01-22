import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:grocery/features/auth/presentation/widgets/image_scaffold_back_ground.dart';
import 'package:grocery/features/auth/presentation/widgets/login_buttom_sheet_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, this.email});
  final String? email;

  static dynamic route(String? email) =>
      MaterialPageRoute(builder: (context) => LoginScreen(email: email));
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginAuthFailure) {
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.white,
          bottomSheet: Container(
            height: 405.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: LoginBottomSheetBody(userEmail: email),
          ),
          body: SafeArea(
            child: ImageScaffoldBackGround(
              image: AppAssets.loginBackGroundImage,
            ),
          ),
        );
      },
    );
  }
}
