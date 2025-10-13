import 'package:ayu_admin_panel/services/services.dart';

abstract interface class DataSource {
  Future<AnalyticResponse> getAnalytic(AnalyticParam param);
  Future<List<ReportResponse>> getReport(ReportParam param);
  Future<List<UsersReportResponse>> getUsers(UsersReportParam param);
  Future<List<AvarSearchResponse>> getAvarSearch(AvarSearchParam param);
  Future<List<AvarSearchResponse>> getDraftedAvar(AvarSearchParam param);
  Future<List<AvarSearchResponse>> getApprovedAvar(AvarSearchParam param);
  
  // Notification methods
  Future<List<NotificationListResponse>> getNotificationList(NotificationListParam param);
  Future<AddNotificationResponse> addNotification(AddNotificationParam param);
  Future<NotificationControlResponse> controlNotification(NotificationControlParam param);
}