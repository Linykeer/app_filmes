// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CastsModel {
  final String name;
  final String image;
  final String caracter;

  CastsModel({required this.name, required this.image, required this.caracter});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'caracter': caracter,
    };
  }

  factory CastsModel.fromMap(Map<String, dynamic> map) {
    return CastsModel(
      name: map['original_name'] ?? '',
      image: 'https://image.tmdb.org/t/p/w200/${map['profile_path']}',
      caracter: map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastsModel.fromJson(String source) =>
      CastsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
