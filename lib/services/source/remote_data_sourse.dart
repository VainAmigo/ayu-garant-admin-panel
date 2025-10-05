import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RemoteDataSource implements DataSource {
  const RemoteDataSource(this.client);

  final ApiClient client;

  @override
  Future<AnalyticResponse> getAnalytic(AnalyticParam param) async {
    try {
      final response = await client.get<Map<String, dynamic>>(
        '/analytic',
        queryParameters: param.toJson(),
      );

      return AnalyticResponse.fromJson(response.data!);
    } catch (e) {
      throw Exception('Ошибка получения аналитических данных: $e');
    }
  }
}