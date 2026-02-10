import 'package:hive/hive.dart';

part 'mascota_model.g.dart';

@HiveType(typeId: 0)
class Mascota extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nombre;

  @HiveField(2)
  String especie;

  @HiveField(3)
  int edad;

  Mascota({
    required this.id,
    required this.nombre,
    required this.especie,
    required this.edad,
  });
}
