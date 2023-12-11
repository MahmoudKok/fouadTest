// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UpdateProfileModel {
  String? name;
  String? email;
  String? phone;
  String? country_code;
  UpdateProfileModel({
    this.name,
    this.email,
    this.phone,
    this.country_code,
  });

  UpdateProfileModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? country_code,
  }) {
    return UpdateProfileModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      country_code: country_code ?? this.country_code,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'country_code': country_code,
    };
  }

  factory UpdateProfileModel.fromMap(Map<String, dynamic> map) {
    return UpdateProfileModel(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      country_code:
          map['country_code'] != null ? map['country_code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileModel.fromJson(String source) =>
      UpdateProfileModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UpdateProfileModel(name: $name, email: $email, phone: $phone, country_code: $country_code)';
  }

  @override
  bool operator ==(covariant UpdateProfileModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.email == email &&
        other.phone == phone &&
        other.country_code == country_code;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        country_code.hashCode;
  }
}
