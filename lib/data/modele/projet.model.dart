import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'projet.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ProjetModel {
  final int id;
  final String name;
  final String description;
  final String date;
  final String url;
  final String image;

  const ProjetModel(this.id, this.name, this.description, this.date, this.url, this.image);

  factory ProjetModel.fromJson(Map<String, dynamic> json) =>
      _$ProjetModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProjetModelToJson(this);

  ProjetEntity get toEntity => ProjetEntity(
      id,
      name,
      description,
      date,
      url,
      image
    );
}
