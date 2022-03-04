import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vial_app/providers/auth_provider.dart';
import 'package:vial_app/ui/input_decorations.dart';
import 'package:vial_app/widgets/widgets.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.report_outlined,
                size: 150,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.globalInputDecoration(
                  context: context,
                  hintText: 'thr',
                  labelText: 'Username',
                  prefixIcon: Icons.person_rounded,
                ),
                onChanged: (value) => auth.username = value,
              ),
              const SizedBox(height: 20),
              TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecorations.globalInputDecoration(
                  context: context,
                  hintText: '******',
                  labelText: 'Password',
                  prefixIcon: Icons.lock_rounded,
                ),
                onChanged: (value) => auth.password = value,
              ),
              const SizedBox(height: 20),
              ButtonForm(
                icon: Icons.login,
                text: 'Iniciar sesion',
                onPressed: () async {
                  await auth.login(auth.username, auth.password);
                  Navigator.pushReplacementNamed(context, 'splash');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
