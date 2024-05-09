
import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/abstraction/view_model_abs.dart';
import 'package:e_porfolio/ui/screens/detail.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
final StateNotifierProvider<DetailViewModel, DetailState> detailProvider =
    StateNotifierProvider<DetailViewModel, DetailState>(
  (StateNotifierProviderRef<DetailViewModel, DetailState> ref) => DetailViewModel(ProjetEntity(0, "nom", "dscription", "date", "url", "image", "categorie")),
);

class DetailViewModel extends ViewModelAbs<DetailViewModel, DetailState> {

  DetailViewModel(ProjetEntity projet):
        super(DetailState.initial(projet)) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init(){
  }
}
