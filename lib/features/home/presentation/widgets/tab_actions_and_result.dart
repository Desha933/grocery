import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/core/common/shared_widget.dart/spacing.dart';
import 'package:grocery/core/utils/app_colors.dart';
import 'package:grocery/core/utils/styles.dart';
import 'package:grocery/features/home/presentation/widgets/item_reviewers.dart';

class TabActionsAndResult extends StatefulWidget {
  const TabActionsAndResult({super.key});

  @override
  State<TabActionsAndResult> createState() => _TabActionsAndResultState();
}

class _TabActionsAndResultState extends State<TabActionsAndResult> {
  int selectedIndex = 0;
  List<String> tabs = ['Description', 'Review', 'Discussion'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(tabs.length, (index) {
            final bool isSelected = selectedIndex == index;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedDefaultTextStyle(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      style: isSelected
                          ? Styles.semiBold20BlackPoppins.copyWith(
                              fontSize: 18.sp,
                            )
                          : Styles.regular16Gray.copyWith(fontSize: 18.sp),
                      child: Text(tabs[index]),
                    ),

                    const SizedBox(height: 8),

                    // Divider مع Fade
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      opacity: isSelected ? 1 : 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 250),
                        height: 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.lightYellow
                              : const Color.fromARGB(255, 217, 221, 219),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
        verticalSpacing(23),
        selectedIndex == 0
            ? DescriptionText()
            : selectedIndex == 1
            ? Reviewers()
            : SizedBox(),
      ],
    );
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ",
      style: Styles.regular16Gray.copyWith(fontSize: 14.sp),
    );
  }
}
