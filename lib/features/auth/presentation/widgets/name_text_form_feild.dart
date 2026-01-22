import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class NameTextFormFeild extends StatefulWidget {
  const NameTextFormFeild({super.key, this.onchange});

  final void Function(String?)? onchange;

  @override
  State<NameTextFormFeild> createState() => _NameTextFormFeildState();
}

class _NameTextFormFeildState extends State<NameTextFormFeild> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150.w,
      height: 59.h,
      child: TextFormField(
        onChanged: widget.onchange,
        style: Styles.regular15BlackDMSans,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 16.w),
          hintText: "Name",
          hintStyle: Styles.regular15BlackDMSans,
          filled: true,
          fillColor: AppColors.white,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.orange, width: 1.w),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.r),
            borderSide: BorderSide(color: AppColors.orange, width: 1.5.w),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.r)),
        ),
      ),
    );
  }
}
