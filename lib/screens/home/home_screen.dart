import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/screens/screens.dart';

import '../../providers/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    ref.read(reportProvider).setTabController(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final form = ref.watch(reportProvider);

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxHeight: 150.0),
            child: Container(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                controller: _controller,
                tabs: const [
                  Tab(
                    text: 'PASO 1',
                  ),
                  Tab(
                    text: 'PASO 2',
                  ),
                  Tab(
                    text: 'PASO 3',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: [
                Step1Screen(
                  form: form,
                ),
                Step2Screen(
                  form: form,
                ),
                Step3Screen(
                  form: form,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
