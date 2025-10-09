import 'package:ayu_admin_panel/services/services.dart';

abstract interface class DataSource {
  Future<AnalyticResponse> getAnalytic(AnalyticParam param);
  Future<List<ReportResponse>> getReport(ReportParam param);
}