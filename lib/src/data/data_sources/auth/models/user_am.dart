import 'package:dart_mappable/dart_mappable.dart';

part 'generated/user_am.mapper.dart';

@MappableClass()
class UserAM with UserAMMappable {
  const UserAM({
    required this.id,
  });

  final String id;
}
