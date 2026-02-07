import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:grocery/features/auth/presentation/widgets/custom_rich_text.dart';
import 'package:grocery/features/auth/presentation/widgets/email_and_password_text_form_feild.dart';
import 'package:grocery/features/auth/presentation/widgets/name_text_form_feild.dart';

class RegisterBottomSheetBody extends StatefulWidget {
  const RegisterBottomSheetBody({super.key});

  @override
  State<RegisterBottomSheetBody> createState() =>
      _RegisterBottomSheetBodyState();
}

class _RegisterBottomSheetBodyState extends State<RegisterBottomSheetBody> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 28.w),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpacing(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Create your account',
                  style: Styles.semiBold20BlackPoppins,
                ),
                IconButton(
                  onPressed: () => AppRoutes.router.pop(),
                  icon: Icon(Icons.cancel),
                ),
              ],
            ),
            verticalSpacing(40),
            Row(
              children: [
                NameTextFormFeild(controller: _firstNameController),
                horizontalSpacing(18),
                NameTextFormFeild(controller: _lastNameController),
              ],
            ),
            verticalSpacing(16),
            EmailAndPasswordTextFormFeild(
              controller: _emailController,
              hintText: "Email",
            ),
            verticalSpacing(13),
            EmailAndPasswordTextFormFeild(
              controller: _passwordController,
              hintText: "Password",
              isObscure: true,
            ),
            verticalSpacing(10),
            CustomRichText(),
            verticalSpacing(23),

            CustomSharedButton(
              text: 'CREATE AN ACCOUNT',
              textStyle: Styles.bold16Black.copyWith(
                fontFamily: GoogleFonts.poppins().fontFamily,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthBloc>().add(
                    RegisterUserEvent(
                      name:
                          "${_firstNameController.text.trim()} ${_lastNameController.text.trim()}",
                      email: _emailController.text.trim(),
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
