import 'package:app_using_getx/generated/json/base/json_field.dart';
import 'package:app_using_getx/generated/json/user_profile_entity.g.dart';
import 'dart:convert';

@JsonSerializable()
class UserProfileEntity {
  int? page;
  @JSONField(name: "per_page")
  int? perPage;
  int? total;
  @JSONField(name: "total_pages")
  int? totalPages;
  List<UserProfileData>? data;
  UserProfileSupport? support;

  UserProfileEntity();

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      $UserProfileEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileEntityToJson(this);

  UserProfileEntity copyWith(
      {int? page,
      int? perPage,
      int? total,
      int? totalPages,
      List<UserProfileData>? data,
      UserProfileSupport? support}) {
    return UserProfileEntity()
      ..page = page ?? this.page
      ..perPage = perPage ?? this.perPage
      ..total = total ?? this.total
      ..totalPages = totalPages ?? this.totalPages
      ..data = data ?? this.data
      ..support = support ?? this.support;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileData {
  int? id;
  String? email;
  @JSONField(name: "first_name")
  String? firstName;
  @JSONField(name: "last_name")
  String? lastName;
  String? avatar;
  bool isFavorite = false;

  UserProfileData();

  factory UserProfileData.fromJson(Map<String, dynamic> json) =>
      $UserProfileDataFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileDataToJson(this);

  UserProfileData copyWith(
      {int? id,
      String? email,
      String? firstName,
      String? lastName,
      String? avatar,
      bool? isFavorite}) {
    return UserProfileData()
      ..id = id ?? this.id
      ..email = email ?? this.email
      ..firstName = firstName ?? this.firstName
      ..lastName = lastName ?? this.lastName
      ..avatar = avatar ?? this.avatar
      ..isFavorite = isFavorite ?? this.isFavorite;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserProfileSupport {
  String? url;
  String? text;

  UserProfileSupport();

  factory UserProfileSupport.fromJson(Map<String, dynamic> json) =>
      $UserProfileSupportFromJson(json);

  Map<String, dynamic> toJson() => $UserProfileSupportToJson(this);

  UserProfileSupport copyWith({String? url, String? text}) {
    return UserProfileSupport()
      ..url = url ?? this.url
      ..text = text ?? this.text;
  }

  @override
  String toString() {
    return jsonEncode(this);
  }
}
