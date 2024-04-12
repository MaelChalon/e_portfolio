import 'package:e_porfolio/ui/abstraction/view_model_abs.dart';
import 'package:e_porfolio/ui/screens/home.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
///
final StateNotifierProvider<HomeViewModel, HomeState> homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>(
  (StateNotifierProviderRef<HomeViewModel, HomeState> ref) => HomeViewModel(),
);

class HomeViewModel extends ViewModelAbs<HomeViewModel, HomeState> {

  HomeViewModel():
        super(const HomeState.initial()) {
    _init();
  }

  void updateLoading(bool value) {
    state = state.copyWith(loading: value);
  }

  void _init(){
  }
}
