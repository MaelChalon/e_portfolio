import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/abstraction/view_state_abs.dart';

part 'detail.state.g.dart';

@CopyWith()
class DetailState extends ViewStateAbs {
  final bool loading;
  final ProjetEntity projet;

  const DetailState({required this.loading, required this.projet});

  const DetailState.initial(this.projet) : loading = false;

  @override
  List<Object?> get props => <Object?>[
        loading,
        projet,
      ];
}
