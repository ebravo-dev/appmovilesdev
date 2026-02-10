import 'package:get/get.dart';
import '../../data/model/mascota_model.dart';
import '../../data/services/mascota_repository.dart';

class MascotaController extends GetxController {
  final MascotaRepository _repository;

  MascotaController(this._repository);

  final RxList<Mascota> mascotas = <Mascota>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadMascotas();
  }

  Future<void> loadMascotas() async {
    isLoading.value = true;
    try {
      mascotas.assignAll(await _repository.getAll());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addMascota(String nombre, String especie, int edad) async {
    final mascota = Mascota(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: nombre,
      especie: especie,
      edad: edad,
    );
    await _repository.add(mascota);
    await loadMascotas();
  }

  Future<void> updateMascota(Mascota mascota) async {
    await _repository.update(mascota);
    await loadMascotas();
  }

  Future<void> deleteMascota(String id) async {
    await _repository.delete(id);
    await loadMascotas();
  }
}
