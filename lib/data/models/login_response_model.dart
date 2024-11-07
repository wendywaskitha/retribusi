import 'package:retribusi/data/models/user_model.dart';

class LoginResponseModel {
  final String token;
  final UserModel user;
  final String message;

  LoginResponseModel({
    required this.token,
    required this.user,
    required this.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json['data']['token'] as String,
      user: UserModel.fromJson(json['data']['user']),
      message: json['message'] as String,
    );
  }
}