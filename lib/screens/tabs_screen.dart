import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vial_app/providers/tabs_provider.dart';

import 'package:vial_app/screens/screens.dart';
import 'package:vial_app/widgets/widgets.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario Vial'),
      ),
      body: const _Body(),
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int index = ref.watch(tabsProvider);
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return Container();
      default:
        return const HomeScreen();
    }
  }
}
