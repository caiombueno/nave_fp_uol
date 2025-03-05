import 'package:dart_mappable/dart_mappable.dart';

part 'generated/user.mapper.dart';

@MappableClass()
class User with UserMappable {
  const User({
    required this.id,
  });

  final String id;
}
