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

  @override
  Future<List<PolicyReportResponse>> getPolicyReport(PolicyReportParam param) async {
    try {
      final response = await client.get<List<dynamic>>(
        '/reports/policy',
        queryParameters: param.toJson(),
      );

      return (response.data as List)
          .map((json) => PolicyReportResponse.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Ошибка получения данных о полисах: $e');
    }
  }
}