import 'package:flutter/material.dart';
import 'package:grocery/core/utils/app_routes.dart';
import 'package:grocery/features/auth/presentation/widgets/congratulation_dialog.dart';

void showCongratulationOverlay(BuildContext context, String email) {
  late OverlayEntry overlayEntry;

  return Overlay.of(context).insert(
    overlayEntry = OverlayEntry(
      builder: (context) {
        return CongratulationDialog(
          callBack: () {
            overlayEntry.remove();
            AppRoutes.router.push(AppRoutes.loginScreen, extra: email);
          },
        );
      },
    ),
  );
}
