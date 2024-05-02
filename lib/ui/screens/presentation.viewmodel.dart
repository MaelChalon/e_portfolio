import 'package:e_porfolio/ui/abstraction/view_model_abs.dart';
import 'package:e_porfolio/ui/screens/presentation.state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
///
final StateNotifierProvider<PresentationViewModel, PresentationState> PresentationProvider =
    StateNotifierProvider<PresentationViewModel, PresentationState>(
  (StateNotifierProviderRef<PresentationViewModel, PresentationState> ref) => PresentationViewModel(),
);

class PresentationViewModel extends ViewModelAbs<PresentationViewModel, PresentationState> {

  PresentationViewModel():
        super(PresentationState.initial()) {
    _init();
  }

  void _init(){
  }
}
