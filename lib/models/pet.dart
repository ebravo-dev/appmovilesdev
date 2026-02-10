class Pet {
  final String id;
  final String clientId;
  final String name;
  final String species;
  final String breed;
  final int age;

  Pet({
    required this.id,
    required this.clientId,
    required this.name,
    this.species = '',
    this.breed = '',
    this.age = 0,
  });

  Pet copyWith({String? name, String? species, String? breed, int? age}) {
    return Pet(
      id: id,
      clientId: clientId,
      name: name ?? this.name,
      species: species ?? this.species,
      breed: breed ?? this.breed,
      age: age ?? this.age,
    );
  }
}
