import 'package:get/get.dart';
import 'controller.dart';
import 'repository.dart';

class MyModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyModuleController>(() => MyModuleController());
    Get.lazyPut<MyModuleRepository>(() => MyModuleRepository());
  }
}
