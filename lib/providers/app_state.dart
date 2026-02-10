import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../models/client.dart';
import '../models/pet.dart';

class AppState extends ChangeNotifier {
  final List<Client> _clients = [];
  final List<Pet> _pets = [];
  final _uuid = const Uuid();

  List<Client> get clients => List.unmodifiable(_clients);
  List<Pet> get pets => List.unmodifiable(_pets);

  // Client Methods
  void addClient({required String name, String phone = '', String email = ''}) {
    final client = Client(
      id: _uuid.v4(),
      name: name,
      phone: phone,
      email: email,
    );
    _clients.add(client);
    notifyListeners();
  }

  void updateClient(Client updatedClient) {
    final index = _clients.indexWhere((c) => c.id == updatedClient.id);
    if (index != -1) {
      _clients[index] = updatedClient;
      notifyListeners();
    }
  }

  void deleteClient(String id) {
    _clients.removeWhere((c) => c.id == id);
    _pets.removeWhere((p) => p.clientId == id);
    notifyListeners();
  }

  // Pet Methods
  void addPet({
    required String clientId,
    required String name,
    String species = '',
    String breed = '',
    int age = 0,
  }) {
    final pet = Pet(
      id: _uuid.v4(),
      clientId: clientId,
      name: name,
      species: species,
      breed: breed,
      age: age,
    );
    _pets.add(pet);
    notifyListeners();
  }

  void updatePet(Pet updatedPet) {
    final index = _pets.indexWhere((p) => p.id == updatedPet.id);
    if (index != -1) {
      _pets[index] = updatedPet;
      notifyListeners();
    }
  }

  void deletePet(String id) {
    _pets.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  List<Pet> getPetsForClient(String clientId) {
    return _pets.where((p) => p.clientId == clientId).toList();
  }
}
