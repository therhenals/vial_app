import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vial_app/providers/providers.dart';
import 'package:vial_app/screens/screens.dart';
import './widgets/custom_bottom_navigation.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario Vial'),
        actions: [
          IconButton(
            onPressed: () async {
              await auth.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
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
    final report = ref.read(reportProvider);

    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        report.getAll();
        return const HistoryScreen();
      default:
        return const HomeScreen();
    }
  }
}
