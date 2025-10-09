import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RepositoryImpl implements Repository {
  const RepositoryImpl(this.dataSource);

  final DataSource dataSource;

  @override
  Future<AnalyticEntity> getAnalytic(AnalyticParam param) async {
    final data = await const MocDataSource().getAnalytic(param);
    // final data = await dataSource.getAnalytic(param);
    return data.toEntity();
  }

  @override
  Future<List<ReportEntity>> getReport(ReportParam param) async {
    final data = await const MocDataSource().getReport(param);
    // final data = await dataSource.getReport(param);
    return data.map((e) => e.toEntity()).toList();
  }
}