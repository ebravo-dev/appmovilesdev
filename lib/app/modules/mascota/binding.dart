import 'package:get/get.dart';
import 'controller.dart';
import '../../data/services/mascota_repository.dart';
import '../../data/provider/mascota_provider.dart';

class MascotaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MascotaProvider>(() => MascotaProvider());
    Get.lazyPut<MascotaRepository>(
      () => MascotaRepository(Get.find<MascotaProvider>()),
    );
    Get.lazyPut<MascotaController>(
      () => MascotaController(Get.find<MascotaRepository>()),
    );
  }
}
