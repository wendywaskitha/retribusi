import 'package:retribusi/domain/entities/pasar.dart';

class User {
  final int id;
  final String name;
  final String email;
  final List<String> roles;
  final List<Pasar> pasars;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.pasars,
  });
}