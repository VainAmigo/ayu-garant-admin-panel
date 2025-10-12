import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RepositoryImpl implements Repository {
  const RepositoryImpl(this.dataSource);

  final DataSource dataSource;

  // request for analytic page
  @override
  Future<AnalyticEntity> getAnalytic(AnalyticParam param) async {
    final data = await const MocDataSource().getAnalytic(param);
    // final data = await dataSource.getAnalytic(param);
    return data.toEntity();
  }

  // universal report request
  @override
  Future<List<ReportEntity>> getReport(ReportParam param) async {
    final data = await const MocDataSource().getReport(param);
    // final data = await dataSource.getReport(param);
    return data.map((e) => e.toEntity()).toList();
  }

  // request for users page
  @override
  Future<List<UsersReportEntity>> getUsers(UsersReportParam param) async {
    final data = await const MocDataSource().getUsers(param);
    // final data = await dataSource.getUsers(param);
    return data.map((e) => e.toEntity()).toList();
  }

  // universal request for avar page
  @override
  Future<List<AvarSearchEntity>> getAvarSearch(AvarSearchParam param) async {
    final data = await const MocDataSource().getAvarSearch(param);
    // final data = await dataSource.getAvar(param);
    return data.map((e) => e.toEntity()).toList();
  }
}