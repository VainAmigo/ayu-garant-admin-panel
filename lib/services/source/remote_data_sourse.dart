import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RemoteDataSource implements DataSource {
  const RemoteDataSource(this.client);

  final RemoteClient client;

  @override
  Future<AnalyticResponse> getAnalytic(AnalyticParam param) async {
    final response = await client.post<Map<String, dynamic>>(
      '/analytic',
      body: param.toBody().toJson(),
    );

    return response.fold((l) => throw l, AnalyticResponse.fromJson);
  }

  @override
  Future<List<ReportResponse>> getReport(ReportParam param) async {
    final response = await client.post<List<dynamic>>(
      '/reports/policy',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map(
            (e) => ReportResponse.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}
