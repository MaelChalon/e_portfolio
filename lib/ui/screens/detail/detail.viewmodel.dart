
import 'package:e_porfolio/ui/abstraction/view_model_abs.dart';
import 'package:e_porfolio/ui/screens/detail/detail.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///
final StateNotifierProvider<DetailViewModel, DetailState> detailProvider =
    StateNotifierProvider<DetailViewModel, DetailState>(
  (StateNotifierProviderRef<DetailViewModel, DetailState> ref) => DetailViewModel(),
);

class DetailViewModel extends ViewModelAbs<DetailViewModel, DetailState> {

  DetailViewModel():
        super(const DetailState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init(){
  }
}
