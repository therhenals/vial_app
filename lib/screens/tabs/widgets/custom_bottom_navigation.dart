import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/providers/tabs_provider.dart';

class CustomBottomNavigation extends ConsumerWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int currentIndex = ref.watch(tabsProvider);

    return NavigationBar(
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        NavigationDestination(
          icon: Icon(Icons.notes),
          label: 'Historial',
        ),
      ],
      selectedIndex: currentIndex,
      onDestinationSelected: (int i) => ref.read(tabsProvider.state).state = i,
    );
  }
}
