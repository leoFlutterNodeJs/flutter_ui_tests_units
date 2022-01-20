import 'package:meta/meta.dart';

class User {
  final String id, email, name, lastName;
  final DateTime birthday;

  User({
    @required this.id,
    @required this.email,
    @required this.name,
    @required this.lastName,
    @required this.birthday,
  }) {
    assert(id != null, "id can't be null");
  }
}
