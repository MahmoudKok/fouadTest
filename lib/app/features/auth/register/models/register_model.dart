import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModel {
  String? name;
  String? email;
  String? password;
  String? password_confirm;
  String? phone;
  String? country_code;
  RegisterModel({
    this.name,
    this.email,
    this.password,
    this.password_confirm,
    this.phone,
    this.country_code,
  });

  @override
  String toString() {
    return 'RegisterModel(name: $name, email: $email, password: $password, password_confirm: $password_confirm, phone: $phone, country_code: $country_code)';
  }

  RegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    String? password_confirm,
    String? phone,
    String? country_code,
  }) {
    return RegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      password_confirm: password_confirm ?? this.password_confirm,
      phone: phone ?? this.phone,
      country_code: country_code ?? this.country_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirm': password_confirm,
      'phone': phone,
      'country_code': country_code,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      password_confirm: map['password_confirm'] != null
          ? map['password_confirm'] as String
          : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      country_code:
          map['country_code'] != null ? map['country_code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.password == password &&
        other.password_confirm == password_confirm &&
        other.phone == phone &&
        other.country_code == country_code;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        password_confirm.hashCode ^
        phone.hashCode ^
        country_code.hashCode;
  }
}
