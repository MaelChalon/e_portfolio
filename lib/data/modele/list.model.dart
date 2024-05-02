import 'package:e_porfolio/data/modele/projet.model.dart';
import 'package:e_porfolio/domain/entities/list.entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list.model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class ListModel {
  final List<ProjetModel> listProjet;

  const ListModel(this.listProjet);

  factory ListModel.fromJson(Map<String, dynamic> json) =>
      _$ListModelFromJson(json);

  Map<String, dynamic> toJson() => _$ListModelToJson(this);

  ListEntity get toEntity => ListEntity(
      listProjet.map((ProjetModel projet) => projet.toEntity).toList()
    );
}
