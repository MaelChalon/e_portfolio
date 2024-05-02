import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationScreen extends ConsumerStatefulWidget {
  const PresentationScreen({super.key});

  @override
  ConsumerState<PresentationScreen> createState() => _PresentationScreeenState();
}

class _PresentationScreeenState extends ConsumerState<PresentationScreen> {
  final String name = "Mael CHALON";
  final String dateOfBirth = "27 décembre 2003";
  final String email = "mael.chalon@outlook.fr";
  final String phoneNumber = "+33783901119";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Informations personnelles',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildInfoRow('Nom', name),
            _buildInfoRow('Date de naissance', dateOfBirth),
            _buildInfoRow('Email', email),
            _buildInfoRow('Téléphone', phoneNumber),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                _launchPDF(context);
              },
              child: const Text('Télécharger mon CV'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchPDF(BuildContext context) async {
    try {
      final ByteData bytes = await rootBundle.load('images/Mael_CHALON.pdf'); // Chemin vers votre fichier PDF dans les actifs
      final Uint8List pdf = bytes.buffer.asUint8List();

      final tempDir = await getTemporaryDirectory();
      final tempPath = tempDir.path;
      final file = File('$tempPath/mon_cv.pdf');
      await file.writeAsBytes(pdf);
      final url = file.path;

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Impossible de lancer $url';
      }
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur: ${e.message}'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erreur inattendue: $e'),
        ),
      );
    }
  }
}