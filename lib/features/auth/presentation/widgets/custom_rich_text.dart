import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: Styles.regular15BlackDMSans.copyWith(
            fontFamily: GoogleFonts.poppins().fontFamily,
          ), // default style
          children: [
            const TextSpan(text: 'By tapping Sign up you accept all '),
            TextSpan(
              text: '\nterms',
              style: Styles.semiBold20BlackPoppins.copyWith(
                color: AppColors.lightYellow,
              ),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'condition',
              style: Styles.semiBold20BlackPoppins.copyWith(
                color: AppColors.lightYellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
