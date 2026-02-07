import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/auth/domain/entities/user_entity.dart';
import 'package:grocery/features/home/presentation/widgets/row_text_with_icon.dart';

class HomeScreenHeader extends StatelessWidget {
  const HomeScreenHeader({super.key, required this.user});
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpacing(19),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: Text(
            'Good Morning',
            style: Styles.regular15BlackDMSans.copyWith(
              color: Color(0xff5F5F5F),
              fontFamily: GoogleFonts.poppins().fontFamily,
            ),
          ),
        ),
        RowTextWithIcon(
          text: user.name,
          icon: Icons.notifications,
          textStyle: Styles.semiBold20BlackPoppins,
        ),
      ],
    );
  }
}
