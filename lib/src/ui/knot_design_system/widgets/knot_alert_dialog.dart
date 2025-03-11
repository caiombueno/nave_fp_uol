import 'package:flutter/material.dart';

class KnotAlertDialog extends AlertDialog {
  KnotAlertDialog({
    super.key,
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
              onPressed: onCtaPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
              child: Text(ctaLabel),
            ),
          ],
        );
}
