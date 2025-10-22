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
  Future<List<ReportResponse>> getReport(ReportParam param) async {
    final data = [
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyStatus': 'ACTIVE',
        'policyCost': 15000.0,
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '20101200150250',
        'userPin': '20101200150250',
        'userName': 'Бердалиев Тилек Уланбекович',
        'paymentSystem': 'Freedom Pay',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '1234567890',
        'userPin': '1234567890',
        'userName': 'Иван Иванов',
        'paymentSystem': 'Finik',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '1234567890',
        'userPin': '1234567890',
        'userName': 'Иван Иванов',
        'paymentSystem': 'Finik',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '1234567890',
        'userPin': '1234567890',
        'userName': 'Иван Иванов',
        'paymentSystem': 'Finik',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'model': 'Toyota Camry',
        'brand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '1234567890',
        'userPin': '1234567890',
        'userName': 'Иван Иванов',
        'paymentSystem': 'Finik',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
      {
        'policyNumber': 'AGIMP0001234',
        'creationDate': '2024-01-15T10:30:00Z',
        'startDate': '2024-01-16T00:00:00Z',
        'endDate': '2025-01-15T23:59:59Z',
        'policyType': 'OSAGO',
        'policyCost': 15000.0,
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'policyHolderName': 'Иван Иванов',
        'policyHolderPin': '1234567890',
        'userPin': '1234567890',
        'userName': 'Иван Иванов',
        'paymentSystem': 'Finik',
        'premiumWithoutTax': 10000.0,
        'usedBonuses': 1000.0,
        'accruedBonuses': 2000.0,
        'usedCashBack': 1000.0,
        'accruedCashBack': 2000.0,
      },
    ];
    
    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => ReportResponse.fromJson(json)).toList();
  }

  @override
  Future<List<UsersReportResponse>> getUsers(UsersReportParam param) async {
    final data = [
      {
        'id': '1',
        'name': 'Айдар Абдыраимов',
        'phoneNumber': '+996 555 123 456',
        'status': 'ACTIVE',
        'roles': ['ADMIN', 'USER'],
      },
      {
        'id': '2',
        'name': 'Айнура Кыдырбекова',
        'phoneNumber': '+996 555 234 567',
        'status': 'ACTIVE',
        'roles': ['USER'],
      },
      {
        'id': '3',
        'name': 'Бермет Асанова',
        'phoneNumber': '+996 555 345 678',
        'status': 'INACTIVE',
        'roles': ['AVAR_SPECIALIST', 'ACCOUNTANT'],
      },
      {
        'id': '4',
        'name': 'Данияр Токтогулов',
        'phoneNumber': '+996 555 456 789',
        'status': 'ACTIVE',
        'roles': ['ACCOUNTANT'],
      },
      {
        'id': '5',
        'name': 'Эльмира Жумалиева',
        'phoneNumber': '+996 555 567 890',
        'status': 'ACTIVE',
        'roles': ['USER', 'AVAR_SPECIALIST'],
      },
      {
        'id': '6',
        'name': 'Жанар Абдыкадырова',
        'phoneNumber': '+996 555 678 901',
        'status': 'INACTIVE',
        'roles': ['AVAR_SPECIALIST'],
      },
      {
        'id': '7',
        'name': 'Кубанычбек Асанов',
        'phoneNumber': '+996 555 789 012',
        'status': 'ACTIVE',
        'roles': ['ACCOUNTANT', 'ADMIN'],
      },
      {
        'id': '8',
        'name': 'Лейла Мамбетова',
        'phoneNumber': '+996 555 890 123',
        'status': 'ACTIVE',
        'roles': ['USER'],
      },
      {
        'id': '9',
        'name': 'Марат Абдыраимов',
        'phoneNumber': '+996 555 901 234',
        'status': 'INACTIVE',
        'roles': ['ADMIN'],
      },
      {
        'id': '10',
        'name': 'Нурсулуу Асанова',
        'phoneNumber': '+996 555 012 345',
        'status': 'ACTIVE',
        'roles': ['AVAR_SPECIALIST', 'USER', 'ACCOUNTANT'],
      },
    ];
    
    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => UsersReportResponse.fromJson(json)).toList();
  }

  @override
  Future<List<AvarSearchResponse>> getAvarSearch(AvarSearchParam param) async {
    final data = [
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
    ];

    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => AvarSearchResponse.fromJson(json)).toList();
  }

  @override
  Future<List<AvarSearchResponse>> getDraftedAvar(AvarSearchParam param) async {
    final data = [
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
    ];

    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => AvarSearchResponse.fromJson(json)).toList();
  }

    @override
  Future<List<AvarSearchResponse>> getApprovedAvar(AvarSearchParam param) async {
    final data = [
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
      {
        'registrationId': '1',
        'holderName': 'Айдар Абдыраимов',
        'holderPin': 20101200150250,
        'culpritName': 'Айнура Кыдырбекова',
        'culpritPin': 20101200150250,
        'availableDriversPins': [20101200150250, 21223199301000],
        'availableDrivers': 'UPTOFOUR',
        'policyNumber': 'AGIMP0001234',
        'policyStartDate': '2024-01-15T10:30:00Z',
        'policyEndDate': '2025-01-15T10:30:00Z',
        'carModel': 'Toyota Camry',
        'carBrand': 'Toyota',
        'carNumber': '01KG320AQY',
        'vinNumber': 'JN1AZ4EH4EM123456',
        'vidNumber': '234FF-2444545-345-45H4EM123456',
        'accidentDate': '2024-01-15T10:30:00Z',
        'registrationDate': '2024-01-15T10:30:00Z',
        'paymentDate': '2024-01-15T10:30:00Z',
        'accidentCost': 100000.0,
        'paymentAmount': 80000.0,
        'avarStatus': 'NEUTRAL',
        'policyStatus': 'ACTIVE',
      },
    ];

    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => AvarSearchResponse.fromJson(json)).toList();
  }

  // Notification methods
  @override
  Future<List<NotificationListResponse>> getNotificationList(NotificationListParam param) async {
    final data = [
      {
        'id': '1',
        'title': 'Новое уведомление',
        'body': 'Это тестовое уведомление для проверки функциональности, Еженедельный отчет о продажах',
        'type': 'SINGLE',
        'date': '2024-01-15T10:30:00Z',
        'time': '10:30',
        'weekday': 'MONDAY',
        'status': 'ACTIVE',
      },
      {
        'id': '2',
        'title': 'Еженедельное уведомление',
        'body': 'Еженедельный отчет о продажах',
        'type': 'WEEKLY',
        'date': '2024-01-15T10:30:00Z',
        'time': '09:00',
        'weekday': 'MONDAY',
        'status': 'PAUSED',
      },
      {
        'id': '3',
        'title': 'Ежемесячное уведомление',
        'body': 'Ежемесячный отчет о финансовых показателях',
        'type': 'MONTHLY',
        'date': '2024-01-01T00:00:00Z',
        'time': '08:00',
        'weekday': 'MONDAY',
        'status': 'PAUSED',
      },
    ];

    await Future.delayed(const Duration(seconds: 1));
    return data.map((json) => NotificationListResponse.fromJson(json)).toList();
  }

  @override
  Future<AddNotificationResponse> addNotification(AddNotificationParam param) async {
    await Future.delayed(const Duration(seconds: 1));
    
    return const AddNotificationResponse(
      message: 'Уведомление успешно добавлено',
      success: true,
    );
  }

  @override
  Future<NotificationControlResponse> controlNotification(NotificationControlParam param) async {
    await Future.delayed(const Duration(seconds: 1));
    
    return const NotificationControlResponse(
      message: 'Статус уведомления успешно изменен',
      success: true,
    );
  }
}