// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:fouadtest/app/features/updateProfile/models/updateProfileModel.dart';

class UpdateProfileApiResponse {
  final bool success;
  final String message;
  final UpdateProfileModel? data;
  UpdateProfileApiResponse({
    required this.success,
    required this.message,
    this.data,
  });

  UpdateProfileApiResponse copyWith({
    bool? success,
    String? message,
    UpdateProfileModel? data,
  }) {
    return UpdateProfileApiResponse(
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

  factory UpdateProfileApiResponse.fromMap(Map<String, dynamic> map) {
    return UpdateProfileApiResponse(
      success: map['success'] as bool,
      message: map['message'] as String,
      data: map['data'] != null
          ? UpdateProfileModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileApiResponse.fromJson(String source) =>
      UpdateProfileApiResponse.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'UpdateProfileApiResponse(success: $success, message: $message, data: $data)';

  @override
  bool operator ==(covariant UpdateProfileApiResponse other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.message == message &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ message.hashCode ^ data.hashCode;
}
