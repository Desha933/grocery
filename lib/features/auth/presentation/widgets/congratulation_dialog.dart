import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/widgets/congratulation.dart';

class CongratulationDialog extends StatelessWidget {
  const CongratulationDialog({super.key, this.callBack});
  final void Function()? callBack;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Opacity(opacity: 0.25, child: Container(color: Colors.black)),
        ),

        Center(
          child: Dialog(
            elevation: 4,
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Congratulation(callBack: callBack),
          ),
        ),
      ],
    );
  }
}
