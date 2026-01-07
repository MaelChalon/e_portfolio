import 'package:e_porfolio/domain/entities/projet.entity.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatelessWidget {
  final ProjetEntity projet;

  const DetailScreen(this.projet, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "images/${projet.image}.png",
                            width: 64, // You can adjust this size as needed
                            height: 64, // You can adjust this size as needed
                            fit: BoxFit.scaleDown,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif",
                                width: 64, // You can adjust this size as needed
                                height: 64, // You can adjust this size as needed
                                fit: BoxFit.scaleDown,
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
                        SizedBox(height: 8),
                        _buildCategoryChip(projet.categorie),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
                      children: [
                        DetailRow(label: "Date :", value: projet.date, link: false,),
                        DetailRow(label: "Lien :", value: projet.url, link: true,),
                        DetailRow(label: "Catégorie :", value: projet.categorie, link: false),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CarouselSlider(
                      items: [
                        Image.asset(
                          "images/${projet.image}/Image1.png",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.asset(
                          "images/${projet.image}/Image2.png",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.asset(
                          "images/${projet.image}/Image3.png",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                        Image.asset(
                          "images/${projet.image}/Image4.png",
                          errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                "images/404-not-found.gif"
                              );
                            }
                          ),
                      ],
                      options: CarouselOptions(
                        height: 400, // Hauteur du carrousel
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
                    const SizedBox(height: 16),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: DescriptionWidget(projet.description),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

    Widget _buildCategoryChip(String category) {
    IconData iconData;
    Color chipColor;

    // Choisissez l'icône et la couleur en fonction de la catégorie
    switch (category) {
      case "IUT":
        iconData = Icons.school;
        chipColor = Colors.blue;
        break;
      case "CPE":
        iconData = Icons.school;
        chipColor = Colors.blue;
        break;
      case "Entreprise":
        iconData = Icons.business;
        chipColor = Colors.green;
        break;
      case "Personnel":
        iconData = Icons.person;
        chipColor = Colors.orange;
        break;
      default:
        iconData = Icons.category;
        chipColor = Colors.grey;
        break;
    }

    return Chip(
      avatar: Icon(iconData, color: Colors.white),
      label: Text(
        category,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: chipColor,
    );
  }

}

class DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final bool link;

  const DetailRow({
    Key? key,
    required this.label,
    required this.value,
    required this.link,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        if(link)
          InkWell(
            onTap: () {
              _launchUrl(value);
            },
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.blue,
              ),
              overflow: TextOverflow.visible,
            ),
          )
        else
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
            overflow: TextOverflow.visible,
          ),
      ],
    );
  }
}

Future<void> _launchUrl(String url) async {
  final Uri _url = Uri.parse(url);
  launchUrl(_url);
}

class DescriptionWidget extends StatelessWidget {
  final String text;

  const DescriptionWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Description : ",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 18,
            ),
            softWrap: true, // Activer le retour à la ligne automatique
          ),
        ),
      ],
    );
  }
}
