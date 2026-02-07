import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class EmailAndPasswordTextFormFeild extends StatefulWidget {
  const EmailAndPasswordTextFormFeild({
    super.key,
    this.color,
    this.height,
    this.isObscure = false,
    required this.hintText,
    this.onChange,
    this.controller,
  });
  final Color? color;
  final double? height;
  final String hintText;
  final bool isObscure;
  final void Function(String?)? onChange;
  final TextEditingController? controller;
  @override
  State<EmailAndPasswordTextFormFeild> createState() =>
      _EmailAndPasswordTextFormFeildState();
}

class _EmailAndPasswordTextFormFeildState
    extends State<EmailAndPasswordTextFormFeild> {
  late bool _isObscure;
  @override
  void initState() {
    _isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 319.w,
      height: widget.height ?? 59.h,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your ${widget.hintText}';
          }
          return null;
        },
        onChanged: widget.onChange,
        obscuringCharacter: '●',
        obscureText: _isObscure,
        style: Styles.regular15BlackDMSans.copyWith(
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.hintText == "Password"
              ? IconButton(
                  icon: Icon(
                    _isObscure
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.gray,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                )
              : SizedBox.shrink(),
          // contentPadding: EdgeInsets.only(left: 22.w, top: 20.h, bottom: 20.h),
          hintText: widget.hintText,
          hintStyle: Styles.regular16Gray,
          filled: true,
          fillColor: AppColors.white,

          enabledBorder: _border(widget.color),

          focusedBorder: _border(AppColors.orange),
          errorBorder: _border(AppColors.red),

          border: _border(),
        ),
      ),
    );
  }

  OutlineInputBorder _border([Color? color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(30.r),
      borderSide: BorderSide(color: color ?? AppColors.orange, width: 1.5.w),
    );
  }
}
