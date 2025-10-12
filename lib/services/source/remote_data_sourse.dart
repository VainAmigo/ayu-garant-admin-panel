import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RemoteDataSource implements DataSource {
  const RemoteDataSource(this.client);

  final RemoteClient client;

  // request for analytic page
  @override
  Future<AnalyticResponse> getAnalytic(AnalyticParam param) async {
    final response = await client.post<Map<String, dynamic>>(
      '/analytic',
      body: param.toBody().toJson(),
    );

    return response.fold((l) => throw l, AnalyticResponse.fromJson);
  }

  // universal report request
  @override
  Future<List<ReportResponse>> getReport(ReportParam param) async {
    final response = await client.post<List<dynamic>>(
      '/reports/policy',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map((e) => ReportResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // request for users page
  @override
  Future<List<UsersReportResponse>> getUsers(UsersReportParam param) async {
    final response = await client.post<List<dynamic>>(
      '/reports/users',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map((e) => UsersReportResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  // universal request for avar page
  @override
  Future<List<AvarSearchResponse>> getAvarSearch(AvarSearchParam param) async {
    final response = await client.post<List<dynamic>>(
      '/avar/search',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map((e) => AvarSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<List<AvarSearchResponse>> getDraftedAvar(AvarSearchParam param) async {
    final response = await client.post<List<dynamic>>(
      '/avar/drafted',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map((e) => AvarSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  @override
  Future<List<AvarSearchResponse>> getApprovedAvar(
    AvarSearchParam param,
  ) async {
    final response = await client.post<List<dynamic>>(
      '/avar/approved',
      body: param.toBody().toJson(),
    );

    return response.fold(
      (l) => throw l,
      (r) => r
          .map((e) => AvarSearchResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
