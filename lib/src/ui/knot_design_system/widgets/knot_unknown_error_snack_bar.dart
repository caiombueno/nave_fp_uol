import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

class KnotUnknownErrorSnackBar extends SnackBar {
  const KnotUnknownErrorSnackBar({super.key})
      : super(
          content: const _UnknownErrorSnackBarMessage(),
        );
}

class _UnknownErrorSnackBarMessage extends StatelessWidget {
  const _UnknownErrorSnackBarMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text(
      l10n.unknownErrorGeneralSnackbarMessage,
    );
  }
}
