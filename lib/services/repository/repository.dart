import 'package:ayu_admin_panel/services/services.dart';

abstract class Repository {
  Future<AnalyticEntity> getAnalytic(AnalyticParam param);
  Future<List<ReportEntity>> getReport(ReportParam param);
  Future<List<UsersReportEntity>> getUsers(UsersReportParam param);
  Future<List<AvarSearchEntity>> getAvarSearch(AvarSearchParam param);
  Future<List<AvarSearchEntity>> getDraftedAvar(AvarSearchParam param);
  Future<List<AvarSearchEntity>> getApprovedAvar(AvarSearchParam param);
}