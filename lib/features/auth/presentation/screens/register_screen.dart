import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/function/overlay_show_congratulation_diaglog.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/utils/app_assets.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:grocery/features/auth/presentation/widgets/register_bottom_sheet_body.dart';
import 'package:grocery/features/auth/presentation/widgets/image_scaffold_back_ground.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
  static dynamic route() =>
      MaterialPageRoute(builder: (context) => RegisterScreen());
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterAuthFailure) {
          showSnackBar(context, state.errMessage);
        }
        if (state is RegisterAuthSuccess) {
          print(state.user.email);
          showCongratulationOverlay(context, state.user.email);
        }
      },
      builder: (context, state) {
        return Scaffold(
          bottomSheet: Container(
            height: 480.h,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: RegisterBottomSheetBody(),
          ),

          body: SafeArea(
            child: ImageScaffoldBackGround(
              image: AppAssets.registerBackGroundImage,
            ),
          ),
        );
      },
    );
  }
}
