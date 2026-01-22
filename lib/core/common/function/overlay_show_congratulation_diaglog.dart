import 'package:flutter/material.dart';
import 'package:grocery/features/auth/presentation/screens/login_screen.dart';
import 'package:grocery/features/auth/presentation/widgets/congratulation_dialog.dart';

void showCongratulationOverlay(BuildContext context, String email) {
  late OverlayEntry overlayEntry;

  return Overlay.of(context).insert(
    overlayEntry = OverlayEntry(
      builder: (context) {
        return CongratulationDialog(
          callBack: () {
            overlayEntry.remove();
            Navigator.push(context, LoginScreen.route(email));
          },
        );
      },
    ),
  );
}
