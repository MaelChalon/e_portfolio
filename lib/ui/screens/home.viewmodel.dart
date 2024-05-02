import 'package:e_porfolio/application/injections/initializer.dart';
import 'package:e_porfolio/data/repositories/projet.repository.dart';
import 'package:e_porfolio/domain/entities/list.entity.dart';
import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/abstraction/view_model_abs.dart';
import 'package:e_porfolio/ui/screens/home.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(
    projetRepository: injector<ProjetRepository>()
  ),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {
  final ProjetRepository _projetRepository;

  HomeViewModel({required ProjetRepository projetRepository}):
        _projetRepository = projetRepository,
        super(HomeState.initial(List<ProjetEntity>.empty(growable: true))) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void getAllProjet() async {
    try{
      final ListEntity listProjet = await _projetRepository.getAllProjet();
      state = state.copyWith(listProjet : listProjet.listProjet);
    }
    catch(e){
      print("erreur : $e");
    }
  }

  void _init(){
    getAllProjet();
  }
}
