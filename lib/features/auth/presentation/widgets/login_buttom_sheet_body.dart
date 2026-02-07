import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/common/function/show_snake_bar.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:grocery/features/auth/presentation/widgets/email_and_password_text_form_feild.dart';

class LoginBottomSheetBody extends StatefulWidget {
  const LoginBottomSheetBody({super.key, this.userEmail});
  final String? userEmail;

  @override
  State<LoginBottomSheetBody> createState() => _LoginBottomSheetBodyState();
}

class _LoginBottomSheetBodyState extends State<LoginBottomSheetBody> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? email;
  @override
  void initState() {
    if (widget.userEmail != null) {
      email = widget.userEmail;
    } else {
      email = null;
    }

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpacing(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sign In', style: Styles.semiBold20BlackPoppins),
                IconButton(
                  onPressed: () {
                    if (email != null) {
                      showSnackBar(
                        context,
                        "You Are Already Registered Continue To Home",
                      );
                    } else {
                      AppRoutes.router.pop();
                    }
                  },
                  icon: Icon(Icons.cancel),
                ),
              ],
            ),
            verticalSpacing(32),

            EmailAndPasswordTextFormFeild(
              hintText: email ?? "Email",
              color: AppColors.gray,
              controller: _emailController,
            ),
            verticalSpacing(12),
            EmailAndPasswordTextFormFeild(
              hintText: "Password",
              isObscure: true,
              color: AppColors.gray,
              controller: _passwordController,
            ),
            verticalSpacing(12),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Forgot Password?",
                style: Styles.regular15BlackDMSans.copyWith(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  color: AppColors.orange,
                ),
              ),
            ),
            verticalSpacing(42),

            CustomSharedButton(
              text: 'SIGN IN',
              textStyle: Styles.semiBold20BlackPoppins.copyWith(
                fontSize: 16.sp,
              ),
              onPressed: () {
                if (formKey.currentState!.validate() || email != null) {
                  context.read<AuthBloc>().add(
                    LoginUserEvent(
                      email: email ?? _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
