import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class RepositoryImpl implements Repository {
  const RepositoryImpl(this.dataSource);

  final DataSource dataSource;

  @override
  Future<AnalyticEntity> getAnalytic(AnalyticParam param) async {
    final data = await const MocDataSource().getAnalytic(param.toBody());
    // final data = await dataSource.getAnalytic(param.toBody());
    return data.toEntiy();
  }

  @override
  Future<List<PolicyReportEntity>> getPolicyReport(PolicyReportParam param) async {
    final data = await const MocDataSource().getPolicyReport(param.toBody());
    // final data = await dataSource.getPolicyReport(param.toBody());
    return data.map((response) => response.toEntity()).toList();
  }
}