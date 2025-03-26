import 'package:flutter/material.dart';
import 'package:nave_fp_uol/src/utils/extensions/build_context_extensions.dart';

class KnotUnknownErrorSnackBar extends SnackBar {
  const KnotUnknownErrorSnackBar({Key? key})
      : super(
          key: key,
          content: const _UnknownErrorSnackBarMessage(),
        );
}

class _UnknownErrorSnackBarMessage extends StatelessWidget {
  const _UnknownErrorSnackBarMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text(
      l10n.unknownErrorGeneralSnackbarMessage,
    );
  }
}
