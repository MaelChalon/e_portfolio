import 'package:e_porfolio/ui/abstraction/view_state_abs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Base class for viewmodel
abstract class ViewModelAbs<T, S extends ViewStateAbs>
    extends StateNotifier<S> {
  ///
  ViewModelAbs(super.state);
}
