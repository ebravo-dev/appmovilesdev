class Client {
  final String id;
  final String name;
  final String phone;
  final String email;

  Client({
    required this.id,
    required this.name,
    this.phone = '',
    this.email = '',
  });

  Client copyWith({String? name, String? phone, String? email}) {
    return Client(
      id: id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
    );
  }
}
