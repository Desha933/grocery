import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/features/home/presentation/widgets/horizontal_card.dart';

class HorizontalCardListView extends StatelessWidget {
  const HorizontalCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 24.w : 0,
              right: index == 9 ? 24.w : 0,
            ),
            child: HorizontalCard(),
          );
        },
      ),
    );
  }
}
