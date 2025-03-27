import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_test/flutter_test.dart';

class FakeHttpCallableResult<T> extends Fake implements HttpsCallableResult<T> {
  final T data;

  FakeHttpCallableResult({required this.data});
}

class FakeFirebaseAuthUser extends Fake implements auth.User {
  final String uid;

  FakeFirebaseAuthUser({required this.uid});
}
