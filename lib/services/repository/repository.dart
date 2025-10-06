import 'package:ayu_admin_panel/services/services.dart';

abstract class Repository {
  Future<AnalyticEntity> getAnalytic(AnalyticParam param);
  Future<List<PolicyReportEntity>> getPolicyReport(PolicyReportParam param);
}