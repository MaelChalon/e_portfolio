import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_app_file/open_app_file.dart';
import 'package:url_launcher/url_launcher.dart';

class PresentationScreen extends ConsumerStatefulWidget {
  const PresentationScreen({super.key});

  @override
  ConsumerState<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends ConsumerState<PresentationScreen> {

  final String name = "Mael CHALON";
  final String dateOfBirth = "27 décembre 2003";
  final String email = "mael.chalon@outlook.fr";
  final String phoneNumber = "+33783901119";
  final String linkedInUrl = "https://www.linkedin.com/in/mael-chalon/";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon CV'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    'Nom',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(name),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    'Date de naissance',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(dateOfBirth),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: InkWell(
                    onTap: () {
                      _launchEmail(email);
                    },
                    child: Text(
                      email,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: ListTile(
                  title: const Text(
                    'Téléphone',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(phoneNumber),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _openPDF(),
                child: Text('Télécharger mon CV'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () async {
                  _launchUrl(linkedInUrl);
                },
                child: Image.asset(
                  'images/linkedin.png',
                  width: 50,
                  height: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openPDF() {

    if (kDebugMode){
      OpenAppFile.open('assets/images/Mael_CHALON.pdf'); 
    }
    else{
      OpenAppFile.open('assets/images/Mael_CHALON.pdf');
    }
  }

  void _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    launchUrl(_url);
  }

  void _launchEmail(String emailAddress) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: emailAddress,
    );
    if (!await launchUrl(emailLaunchUri)) {
      throw Exception('Could not launch $emailLaunchUri');
    }
  }
}
