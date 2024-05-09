import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/screens/detail.screen.dart';
import 'package:e_porfolio/ui/screens/home.state.dart';
import 'package:e_porfolio/ui/screens/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeState state = ref.watch(homeProvider);

    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          return false;
        },
        child: ListView.builder(
          itemCount: state.listProjet.length, // Nombre d'éléments dans la liste
          itemBuilder: (BuildContext context, int index) {
            // Retourne un widget représentant chaque élément de la liste
            return ListItem(projet : state.listProjet.elementAt(index));
          },

        ),
      )
    );
  }
}

class ListItem extends StatelessWidget {
  final ProjetEntity projet;

  const ListItem({
    super.key,
    required this.projet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Ajoute une légère ombre à la carte
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16), 
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            "images/${projet.image}.png",
            width: 100,
            height: 100,
            fit: BoxFit.scaleDown,
            errorBuilder: (context, error, stackTrace) {
              return Image.asset(
                "images/404-not-found.gif",
                fit: BoxFit.cover,
              );
            }
          ),
        ),
        title: Text(
          projet.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          projet.date,
          style: const TextStyle(
            fontStyle: FontStyle.italic,
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (context, animation, secondaryAnimation) => DetailScreen(projet),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                const begin = Offset(1.0, 0.0);
                const end = Offset.zero;
                const curve = Curves.ease;
                var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                var offsetAnimation = animation.drive(tween);

                return SlideTransition(
                  position: offsetAnimation,
                  child: child,
                );
              },
            ),
          );
        },
      ),
    );
  }
}