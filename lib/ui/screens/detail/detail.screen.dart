import 'package:e_porfolio/ui/screens/detail/detail.state.dart';
import 'package:e_porfolio/ui/screens/detail/detail.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final DetailState state = ref.watch(detailProvider);

    return Scaffold(
      body: state.loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const Placeholder(),
    );
  }
}
