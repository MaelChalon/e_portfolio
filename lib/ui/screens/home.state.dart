import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/abstraction/view_state_abs.dart';

part 'home.state.g.dart';

@CopyWith()
class HomeState extends ViewStateAbs {
  final bool loading;
  final List<ProjetEntity> listProjet;

  const HomeState({required this.loading, required this.listProjet});

  const HomeState.initial(this.listProjet) : loading = false;

  @override
  List<Object?> get props => <Object?>[
        loading,
        listProjet
      ];
}
