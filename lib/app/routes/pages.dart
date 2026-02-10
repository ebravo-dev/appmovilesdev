import 'package:get/get.dart';
import 'routes.dart';
import '../modules/my_module/page.dart';
import '../modules/my_module/binding.dart';
import '../modules/mascota/page.dart';
import '../modules/mascota/binding.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => MyModulePage(),
      binding: MyModuleBinding(),
    ),
    GetPage(
      name: Routes.MASCOTA,
      page: () => const MascotaPage(),
      binding: MascotaBinding(),
    ),
  ];
}
