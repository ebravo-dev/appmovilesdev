import 'package:hive/hive.dart';
import '../model/mascota_model.dart';

class MascotaProvider {
  static const String _boxName = 'mascotas';

  Future<Box<Mascota>> get _box async => await Hive.openBox<Mascota>(_boxName);

  Future<void> addMascota(Mascota mascota) async {
    final box = await _box;
    await box.put(mascota.id, mascota);
  }

  Future<List<Mascota>> getAllMascotas() async {
    final box = await _box;
    return box.values.toList();
  }

  Future<void> updateMascota(Mascota mascota) async {
    final box = await _box;
    await box.put(mascota.id, mascota);
  }

  Future<void> deleteMascota(String id) async {
    final box = await _box;
    await box.delete(id);
  }
}
