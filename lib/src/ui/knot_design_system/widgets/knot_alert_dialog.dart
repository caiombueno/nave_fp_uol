import 'package:flutter/material.dart';

class KnotAlertDialog extends AlertDialog {
  KnotAlertDialog({
    required BuildContext context,
    required String? title,
    required String? message,
    required String ctaLabel,
    VoidCallback? onCtaPressed,
  }) : super(
          title: title != null ? Text(title) : null,
          content: message != null ? Text(message) : null,
          actions: [
            TextButton(
              child: Text(ctaLabel),
              onPressed: onCtaPressed ?? () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
}
