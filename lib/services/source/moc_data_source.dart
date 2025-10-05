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
}
