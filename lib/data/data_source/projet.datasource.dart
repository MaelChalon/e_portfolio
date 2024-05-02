import 'dart:convert';
import 'package:e_porfolio/data/modele/list.model.dart';
import 'package:e_porfolio/data/modele/projet.model.dart';
import 'package:e_porfolio/domain/entities/list.entity.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class ProjetDataSource {

  ProjetDataSource();

  Future<ListModel> getProjet() async {

    String jsonString = await rootBundle.loadString("assets/records.json");
    Map <String, dynamic> json = jsonDecode(jsonString);
    
    return ListModel.fromJson(json);
  }
}
