import 'package:retribusi/domain/entities/pasar.dart';

class PasarModel {
  final int id;
  final String name;

  PasarModel({
    required this.id,
    required this.name,
  });

  factory PasarModel.fromJson(Map<String, dynamic> json) {
    return PasarModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  Pasar toEntity() {
    return Pasar(
      id: id,
      name: name,
    );
  }
}