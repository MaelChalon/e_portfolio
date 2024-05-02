// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListModel _$ListModelFromJson(Map<String, dynamic> json) => ListModel(
      (json['list_projet'] as List<dynamic>)
          .map((e) => ProjetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListModelToJson(ListModel instance) => <String, dynamic>{
      'list_projet': instance.listProjet.map((e) => e.toJson()).toList(),
    };
