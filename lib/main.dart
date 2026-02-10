import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/routes/pages.dart';
import 'app/routes/routes.dart';
import 'app/core/theme/app_theme.dart';
import 'app/data/model/mascota_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MascotaAdapter());

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: Routes.MASCOTA,
      getPages: AppPages.pages,
      theme: appThemeData,
      debugShowCheckedModeBanner: false,
    ),
  );
}
