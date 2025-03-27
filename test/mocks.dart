// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:mixpanel_flutter/mixpanel_flutter.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nave_fp_uol/src/data/data_sources/auth/auth_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/cdn_data_source.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/core/firestore_client.dart';
import 'package:nave_fp_uol/src/data/data_sources/synced/synced_data_source.dart';
import 'package:nave_fp_uol/src/data/repositories/file_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/task/task_repository.dart';
import 'package:nave_fp_uol/src/data/repositories/user/user_repository.dart';
import 'package:nave_fp_uol/src/services/analytics/analytics_client.dart';
import 'package:nave_fp_uol/src/services/error_reporter.dart';
import 'package:nave_fp_uol/src/ui/features/auth/forgot_my_password/state_management/forgot_my_password_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/auth/sign_in/state_management/sign_in_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/lessons/video_lesson/state_management/video_lesson_cubit.dart';
import 'package:nave_fp_uol/src/ui/features/task_details/state_management/task_details_cubit.dart';

class MockTaskRepository extends Mock implements TaskRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockErrorReporter extends Mock implements ErrorReporter {}

class MockFileRepository extends Mock implements FileRepository {}

class MockFirestoreClient extends Mock implements FirestoreClient {}

class MockSyncedDataSource extends Mock implements SyncedDataSource {}

class MockAuthDataSource extends Mock implements AuthDataSource {}

class MockCdnDataSource extends Mock implements CdnDataSource {}

class MockFirebaseFunctions extends Mock implements FirebaseFunctions {}

class MockHttpsCallable extends Mock implements HttpsCallable {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockMixpanel extends Mock implements Mixpanel {}

class MockAnalyticsClient extends Mock implements AnalyticsClient {}

class MockRoute extends Mock implements Route<dynamic> {}

class MockRouteSettings extends Mock implements RouteSettings {}

class MockFirebaseFirestore extends Mock implements FirebaseFirestore {}

class MockCollectionReference<T> extends Mock
    implements CollectionReference<T> {}

class MockDocumentReference<T> extends Mock implements DocumentReference<T> {}

class MockQueryDocumentSnapshot<T> extends Mock
    implements QueryDocumentSnapshot<T> {}

class MockQuerySnapshot<T> extends Mock implements QuerySnapshot<T> {}

class MockDocumentSnapshot<T> extends Mock implements DocumentSnapshot<T> {}

class MockSnapshotMetadata extends Mock implements SnapshotMetadata {}

class MockSetOptions extends Mock implements SetOptions {}

// Mock class for FirebaseException
class MockFirebaseException extends Mock implements FirebaseException {
  @override
  final String code;
  MockFirebaseException(this.code);
}

class MockSignInCubit extends Mock implements SignInCubit {}

class MockForgotMyPasswordCubit extends Mock implements ForgotMyPasswordCubit {}

class MockVideoLessonCubit extends Mock implements VideoLessonCubit {}

class MockTaskDetailsCubit extends Mock implements TaskDetailsCubit {}
