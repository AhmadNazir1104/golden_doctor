import 'dart:convert';

class ProfileModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;

  ProfileModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });

  factory ProfileModel.fromRawJson(String str) =>
      ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
      };
}
