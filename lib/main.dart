import 'package:e_porfolio/application/injections/initializer.dart';
import 'package:e_porfolio/ui/screens/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  initializeInjections();
  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Site historique',
      home: HomeScreen(),
    );
  }
}
