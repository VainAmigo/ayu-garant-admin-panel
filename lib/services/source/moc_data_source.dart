import 'package:ayu_admin_panel/services/services.dart';

final class MocDataSource implements DataSource {
  const MocDataSource();

  @override
  Future<AnalyticResponse> getAnalytic(AnalyticParam param) async {
    const data = {
        'platformType': {
            'android': 12,
            'ios': 23,
        },
        'totalPolicies': 100,
        'purchasedPolicies': 50,
        'financialData': {
            'totalPremiumSum': 1000,
            'premiumSum': 500,
            'usedBonuses': 100,
            'accruedBonuses': 200,
        },
        'policyTypes': {
            'osago': 10,
            'kasko': 20,
            'kaskoMini': 30,
            'dsago': 40,
        },
    };
    await Future.delayed(const Duration(seconds: 1));
    return AnalyticResponse.fromJson(data);
  }

  @override
  Future<List<PolicyReportResponse>> getPolicyReport(PolicyReportParam param) async {
    final data = [
      {
        'policyNumber': 'POL-001-2024',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'model': 'Toyota Camry',
        'brand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyStatus': 'ACTIVE',
      },
      {
        'policyNumber': 'POL-002-2024',
        'creationDate': '2024-02-10T14:20:00Z',
        'startDate': '2024-02-11T00:00:00Z',
        'endDate': '2025-02-10T23:59:59Z',
        'policyType': 'KASKO',
        'policyCost': 45000.0,
        'model': 'BMW X5',
        'brand': 'BMW',
        'policyHolderName': 'Петр Петров',
        'policyStatus': 'ACTIVE',
      },
      {
        'policyNumber': 'POL-003-2024',
        'creationDate': '2024-03-05T09:15:00Z',
        'startDate': '2024-03-06T00:00:00Z',
        'endDate': '2024-12-05T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 12000.0,
        'model': 'Lada Vesta',
        'brand': 'Lada',
        'policyHolderName': 'Мария Сидорова',
        'policyStatus': 'UNPAID',
      },
    ];
    
    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => PolicyReportResponse.fromJson(json)).toList();
  }
}
