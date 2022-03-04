import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/providers/providers.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authProvider);
    final report = ref.read(reportProvider);

    goTo(String route) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, route);
      });
    }

    Future<String> getInitialData() async {
      final user = await auth.checkAuth();
      if (user == null) return 'login';

      await report.getSignalTypes();
      return '';
    }

    return Scaffold(
      body: FutureBuilder(
        future: getInitialData(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          Timer(const Duration(milliseconds: 500), () {
            if (snapshot.hasData) {
              if (snapshot.data == 'login') {
                goTo('login');
              } else {
                goTo('tabs');
              }
            }
          });

          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      ),
    );
  }
}
