// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projet.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjetModel _$ProjetModelFromJson(Map<String, dynamic> json) => ProjetModel(
      json['id'] as int,
      json['name'] as String,
      json['description'] as String,
      json['date'] as String,
      json['url'] as String,
      json['image'] as String,
    );

Map<String, dynamic> _$ProjetModelToJson(ProjetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'date': instance.date,
      'url': instance.url,
      'image': instance.image,
    };
