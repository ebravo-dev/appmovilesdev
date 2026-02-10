import '../model/mascota_model.dart';
import '../provider/mascota_provider.dart';

class MascotaRepository {
  final MascotaProvider _provider;

  MascotaRepository(this._provider);

  Future<void> add(Mascota mascota) => _provider.addMascota(mascota);
  Future<List<Mascota>> getAll() => _provider.getAllMascotas();
  Future<void> update(Mascota mascota) => _provider.updateMascota(mascota);
  Future<void> delete(String id) => _provider.deleteMascota(id);
}
