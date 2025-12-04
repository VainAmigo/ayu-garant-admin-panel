import 'package:dio/dio.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_models.dart';

class AuthRepository {
  final DioClient _dioClient;

  AuthRepository(this._dioClient);

  Future<AuthResponse> login(String username, String password) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.login,
        queryParameters: {'username': username, 'password': password},
      );

      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
