import 'package:e_porfolio/ui/screens/home/home.state.dart';
import 'package:e_porfolio/ui/screens/home/home.viewmodel.dart';
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
      body: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Placeholder(),
    );
  }
}
