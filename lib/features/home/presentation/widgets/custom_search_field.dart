import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(color: AppColors.white),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Color(0xffF0F0F0),
            hintText: 'Search here',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(18.r),
            ),
          ),
        ),
      ),
    );
  }
}
