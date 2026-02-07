import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/utils/styles.dart';

class RowTextWithIcon extends StatelessWidget {
  const RowTextWithIcon({
    super.key,
    required this.text,
    this.textStyle,
    required this.icon,
    this.onPressed,
  });
  final String text;
  final TextStyle? textStyle;
  final IconData icon;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style:
                textStyle ??
                Styles.semiBold20BlackPoppins.copyWith(fontSize: 18.sp),
          ),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: Color(0xff384144)),
          ),
        ],
      ),
    );
  }
}
