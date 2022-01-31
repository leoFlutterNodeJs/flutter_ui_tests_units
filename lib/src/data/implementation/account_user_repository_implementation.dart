import 'package:ui_tests_units/src/data/models/user.dart';
import 'package:ui_tests_units/src/data/providers/remote/account_user_provider.dart';
import 'package:ui_tests_units/src/data/repositories/account_user_repository.dart';

class AccountUserRepositoryImplementation implements AccountUserRepository {
  final AccountUserProvider _provider;
  AccountUserRepositoryImplementation(this._provider);
  @override
  Future<User?> get userAccount => _provider.userAccount;
}
