// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChangePsswordApiResponse {
  final bool success;
  final String message;
  final ChangePasswordModel? data;
  ChangePsswordApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  ChangePsswordApiResponse copyWith({
    bool? success,
    String? message,
    ChangePasswordModel? data,
  }) {
    return ChangePsswordApiResponse(
      success: success ?? this.success,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory ChangePsswordApiResponse.fromMap(Map<String, dynamic> map) {
    return ChangePsswordApiResponse(
      success: map['success'] as bool,
      message: map['message'] as String,
      data: map['data'] != null
          ? ChangePasswordModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePsswordApiResponse.fromJson(String source) =>
      ChangePsswordApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChangePsswordApiResponse(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(covariant ChangePsswordApiResponse other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}

class ChangePasswordModel {
  final String? password;
  final String? password_confirm;
  final String? current_password;
  ChangePasswordModel({
    this.password,
    this.password_confirm,
    this.current_password,
  });

  ChangePasswordModel copyWith({
    String? password,
    String? password_confirm,
    String? current_password,
  }) {
    return ChangePasswordModel(
      password: password ?? this.password,
      password_confirm: password_confirm ?? this.password_confirm,
      current_password: current_password ?? this.current_password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'password_confirm': password_confirm,
      'current_password': current_password,
    };
  }

  factory ChangePasswordModel.fromMap(Map<String, dynamic> map) {
    return ChangePasswordModel(
      password: map['password'] != null ? map['password'] as String : null,
      password_confirm: map['password_confirm'] != null
          ? map['password_confirm'] as String
          : null,
      current_password: map['current_password'] != null
          ? map['current_password'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordModel.fromJson(String source) =>
      ChangePasswordModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChangePasswordModel(password: $password, password_confirm: $password_confirm, current_password: $current_password)';

  @override
  bool operator ==(covariant ChangePasswordModel other) {
    if (identical(this, other)) return true;

    return other.password == password &&
        other.password_confirm == password_confirm &&
        other.current_password == current_password;
  }

  @override
  int get hashCode =>
      password.hashCode ^ password_confirm.hashCode ^ current_password.hashCode;
}
