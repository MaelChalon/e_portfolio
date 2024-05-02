import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:e_porfolio/ui/screens/detail.state.dart';
import 'package:e_porfolio/ui/screens/detail.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailScreen extends ConsumerStatefulWidget {
  final ProjetEntity projet;
  const DetailScreen(this.projet, {super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState(projet: projet);
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  final ProjetEntity projet;

  _DetailScreenState({required this.projet});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DetailState state = ref.watch(detailProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Détails du projet'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            "images/${projet.image}",
                            width: 64, // You can adjust this size as needed
                            height: 64, // You can adjust this size as needed
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif",
                                width: 64, // You can adjust this size as needed
                                height: 64, // You can adjust this size as needed
                                fit: BoxFit.cover,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          projet.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        DetailRow(label: "Date:", value: projet.date),
                        DetailRow(label: "Lien:", value: projet.url),
                        DetailRow(label: "Description:", value: projet.description),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Carrousel d'images
                    CarouselSlider(
                      items: [
                        Image.network(
                          "images/${projet.name}/image1.jpg",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.network("images/${projet.name}/image2.jpg",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.network("images/${projet.name}/image3.jpg",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.network("images/${projet.name}/image4.jpg",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                      ],
                      options: CarouselOptions(
                        height: 200, // Hauteur du carrousel
                        aspectRatio: 16 / 9, // Ratio de l'image
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class DetailRow extends StatelessWidget {
  final String label;
  final String value;

  const DetailRow({super.key, 
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}