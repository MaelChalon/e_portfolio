import 'package:e_porfolio/data/data_source/projet.datasource.dart';
import 'package:e_porfolio/data/modele/list.model.dart';
import 'package:e_porfolio/domain/entities/list.entity.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ProjetRepository {
  final ProjetDataSource _projetDataSource;

  ProjetRepository({required ProjetDataSource projetDataSource})
      : _projetDataSource = projetDataSource;

  Future<ListEntity> getAllProjet() async {
    final ListModel retour = await _projetDataSource.getProjet();

    return retour.toEntity;
  }
}
