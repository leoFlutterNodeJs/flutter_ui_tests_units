import '../data/providers/remote/remote.dart';
import '../data/implementation/implementation.dart';
import '../data/repositories/repositories.dart';

import 'get.dart';

typedef VoidCallback = void Function();

abstract class DependencyInjection {
  static void initialize() {
    final WebSocketProvider webSocketProvider = WebSocketProvider();
    final AuthenticationRepository authenticationRepository =
        AuthenticationRepositoryImpl(AuthenticationProvider());
    final FoodMenuRepositoryImplementation foodMenuRepository =
        FoodMenuRepositoryImplementation(FoodMenuProvider());
    final WebSocketRepository webSocketRepository =
        WebSocketRepositoryImplementation(webSocketProvider);

    Get.i.put<FoodMenuRepository>(foodMenuRepository);
    Get.i.put<AuthenticationRepository>(authenticationRepository);
    Get.i.put<WebSocketRepository>(webSocketRepository);

    final VoidCallback dispose = () {
      webSocketProvider.dispose();
    };
    Get.i.put<VoidCallback>(dispose, tag: "dispose");
  }

  static void dispose() {
    final dispose = Get.i.find<VoidCallback>(tag: "dispose");
    dispose!();
  }
}
