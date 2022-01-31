import 'package:ui_tests_units/src/data/models/user.dart';

abstract class AccountUserRepository {
  Future<User?> get userAccount;
}
