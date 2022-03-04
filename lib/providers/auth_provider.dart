import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:vial_app/models/login_reponse.dart';
import 'package:vial_app/providers/api_provider.dart';

final authProvider =
    ChangeNotifierProvider((ref) => AuthProvider(ref.read(apiProvider)));

class AuthProvider extends ChangeNotifier {
  final ApiProvider api;

  AuthProvider(
    this.api,
  );

  final form = FormGroup({
    'username': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
    'password': FormControl<String>(
      value: '',
      validators: [Validators.required],
    ),
  });

  String get username => form.control('username').value;
  String get password => form.control('password').value;

  set username(String value) {
    form.control('username').value = value;
    notifyListeners();
  }

  set password(String value) {
    form.control('password').value = value;
    notifyListeners();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> login(String username, String password) async {
    final response = await api.post(path: '/auth/login', data: {
      'username': username,
      'password': password,
    });
    final LoginResponse data = LoginResponse.fromMap(response);
    await auth.signInWithCustomToken(data.token);
  }

  Future<void> logout() async {
    await auth.signOut();
  }

  Future<User?> checkAuth() async {
    return auth.currentUser;
  }

  Future<String?> authHeader() async {
    return await auth.currentUser?.getIdToken();
  }
}
