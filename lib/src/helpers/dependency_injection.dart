import '../data/providers/remote/remote.dart';
import '../data/implementation/implementation.dart';
import '../data/repositories/repositories.dart';

import 'get.dart';

abstract class DependencyInjection {
  static void initialize() {
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());
    final FoodMenuRepositoryImplementation foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());
    final WebSocketRepository webSocketRepository =
        WebSocketRepositoryImplementation(WebSocketProvider());

    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<WebSocketRepository>(webSocketRepository);
  }
}
