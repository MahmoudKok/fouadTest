// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ApiResponse {
  final bool success;
  final String message;
  final UserData? data;

  ApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  ApiResponse copyWith({
    bool? success,
    String? message,
    UserData? data,
  }) {
    return ApiResponse(
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

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      success: map['success'] as bool,
      message: map['message'] as String,
      data: map['data'] != null
          ? UserData.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApiResponse.fromJson(String source) =>
      ApiResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ApiResponse(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(covariant ApiResponse other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}

class UserData {
  String? id;
  String? name;
  String? country_code;
  String? phone;
  String? email;
  String? token;
  String? tokenExpiry;
  UserData({
    this.id,
    this.name,
    this.country_code,
    this.phone,
    this.email,
    this.token,
    this.tokenExpiry,
  });

  UserData copyWith({
    String? id,
    String? name,
    String? country_code,
    String? phone,
    String? email,
    String? token,
    String? tokenExpiry,
  }) {
    return UserData(
      id: id ?? this.id,
      name: name ?? this.name,
      country_code: country_code ?? this.country_code,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      token: token ?? this.token,
      tokenExpiry: tokenExpiry ?? this.tokenExpiry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'country_code': country_code,
      'phone': phone,
      'email': email,
      'token': token,
      'tokenExpiry': tokenExpiry,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      country_code:
          map['country_code'] != null ? map['country_code'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
      tokenExpiry:
          map['tokenExpiry'] != null ? map['tokenExpiry'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(id: $id, name: $name, country_code: $country_code, phone: $phone, email: $email, token: $token, tokenExpiry: $tokenExpiry)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.country_code == country_code &&
        other.phone == phone &&
        other.email == email &&
        other.token == token &&
        other.tokenExpiry == tokenExpiry;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        country_code.hashCode ^
        phone.hashCode ^
        email.hashCode ^
        token.hashCode ^
        tokenExpiry.hashCode;
  }
}
