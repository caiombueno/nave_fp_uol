import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/quill_delta.dart' as quill;

extension FlutterQuillDeltaExtension on quill.Delta {
  quill.Document? toDocumentOrNull() {
    try {
      return quill.Document.fromDelta(this);
    } catch (_) {
      return null;
    }
  }
}

extension FlutterQuillDocumentExtension on quill.Document {
  List<Map<String, dynamic>> toJson() {
    return toDelta().toJson();
  }
}

extension FlutterQuillStringExtension on String {
  quill.Delta? toQuillDocumentOrNull() {
    try {
      final parsedString = jsonDecode(this);

      final delta = quill.Delta.fromJson(parsedString);

      if (!delta.isValid) return null;

      return delta;
    } catch (_) {
      return null;
    }
  }
}

extension on quill.Delta {
  bool get isValid {
    // 1️⃣ Check: Document must not be empty
    if (isEmpty) return false;

    // 2️⃣ Check: Last insert must end with `\n`
    if (last.data is! String || !(last.data as String).endsWith('\n')) {
      return false;
    }

    // 3️⃣ Check: All operations must be insert operations
    for (final op in toList()) {
      if (!op.isInsert) return false;
    }

    // ✅ If all checks passed, return true
    return true;
  }
}

extension RawContentQuillExtension on List<Map<String, dynamic>> {
  String? toEncodedContentOrNull() {
    try {
      if (isEmpty) {
        return null;
      }

      return jsonEncode(this);
    } catch (e) {
      return null;
    }
  }
}
