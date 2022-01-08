import 'package:ui_tests_units/src/data/implementation/authentication_respository_implementation.dart';
import 'package:ui_tests_units/src/data/providers/authentication_provider.dart';
import 'package:ui_tests_units/src/data/repositories/authentication_repository.dart';

import 'get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());
    Get.i.put<AuthenticationRepository>(authenticationRepository);
  }
}
