import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) => ApiProvider());

class ApiProvider {
  FirebaseAuth auth = FirebaseAuth.instance;
  final _dio = Dio();

  Future<String?> authHeader() async {
    return await auth.currentUser?.getIdToken();
  }

  ApiProvider() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        final token = await authHeader();
        options.baseUrl = 'http://192.168.0.3:3000';
        if (token != null) {
          options.headers['authorization'] = await authHeader();
        }
        handler.next(options);
      },
    ));
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
  }) async {
    final resp = await _dio.get(path, queryParameters: query);
    return resp;
  }

  Future post({
    required String path,
    required dynamic data,
  }) async {
    final resp = await _dio.post(
      path,
      data: data,
    );
    return resp.data;
  }
}
