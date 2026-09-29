// import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  int id;
  String name;
  String school;
  String address;
  UserModel({
    required this.id,
    required this.name,
    required this.school,
    required this.address,
  });

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'school': school,
      'address': address,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      name: map['name'] as String,
      school: map['school'] as String,
      address: map['address'] as String,
    );
  }

}
