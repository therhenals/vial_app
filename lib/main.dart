import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/screens/screens.dart';
import 'package:vial_app/ui/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventario Vial',
      theme: ThemeStyles.dark(),
      initialRoute: 'splash',
      routes: {
        'splash': (_) => const SplashScreen(),
        'tabs': (_) => const TabsScreen(),
        'login': (_) => const LoginScreen(),
      },
    );
  }
}
