import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:e_porfolio/ui/abstraction/view_state_abs.dart';

part 'presentation.state.g.dart';

@CopyWith()
class PresentationState extends ViewStateAbs {
  final bool loading;

  const PresentationState({required this.loading});

  const PresentationState.initial(): loading = false;

  @override
  List<Object?> get props => <Object?>[
        
      ];
}
