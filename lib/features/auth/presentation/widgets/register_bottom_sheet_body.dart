import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/common/shared_widget.dart/custom_shared_button.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
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
  String? name;
  String? email;
  String? password;
  String? fullName;
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // @override
  // dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

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
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.cancel),
                ),
              ],
            ),
            verticalSpacing(40),
            Row(
              children: [
                NameTextFormFeild(
                  onchange: (value) {
                    name = value;
                  },
                ),
                horizontalSpacing(18),
                NameTextFormFeild(
                  onchange: (value) {
                    fullName = "$name $value";
                  },
                ),
              ],
            ),
            verticalSpacing(16),
            EmailAndPasswordTextFormFeild(
              hintText: "Email",
              onChange: (value) {
                email = value;
              },
            ),
            verticalSpacing(13),
            EmailAndPasswordTextFormFeild(
              hintText: "Password",
              isObscure: true,
              onChange: (value) {
                password = value;
              },
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
                      name: fullName!,
                      email: email!,
                      password: password!,
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

// Future<dynamic> showCongratulationDialog(BuildContext context) {
//     return showDialog(
//       context: context,
//       barrierColor: Colors.transparent,
//       useSafeArea: true,
//       builder: (context) {
//         return Stack(
//           children: [
//             BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
//               child: Opacity(
//                 opacity: 0.25,
//                 child: Container(
//                   decoration: BoxDecoration(color: Colors.black),
//                 ),
//               ),
//             ),

//             Center(
//               child: Dialog(
//                 elevation: 4,
//                 backgroundColor: Colors.transparent,
//                 insetPadding: EdgeInsets.zero,
//                 child: Congratulation(),
//               ),
//             ),
//           ],
//         );
//       },
//     );
