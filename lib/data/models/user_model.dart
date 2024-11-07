class UserModel {
  final int id;
  final String name;
  final String email;
  final List<String> roles;
  final List<PasarModel> pasars;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.pasars,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      roles: List<String>.from(json['roles']),
      pasars: (json['pasars'] as List)
          .map((pasar) => PasarModel.fromJson(pasar))
          .toList(),
    );
  }
}

class PasarModel {
  final int id;
  final String name;

  PasarModel({required this.id, required this.name});

  factory PasarModel.fromJson(Map<String, dynamic> json) {
    return PasarModel(
      id: json['id'],
      name: json['name'],
    );
  }
}