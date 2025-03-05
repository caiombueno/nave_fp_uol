import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_mappable/dart_mappable.dart';

class FieldValueMapper extends SimpleMapper<FieldValue> {
  @override
  FieldValue decode(dynamic value) {
    throw Error();
  }

  @override
  dynamic encode(FieldValue self) {
    return self;
  }
}
