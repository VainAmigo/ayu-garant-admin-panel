/// Генератор тестовых данных для полисов
class PolicyDataGenerator {
  
  /// Список типов полисов
  static const List<String> policyTypes = [
    'КАСКО-мини',
    'ОСАГО',
    'ДСАГО',
    'КАСКО',
    'ДОСАГО',
  ];

  /// Список статусов
  static const List<String> statuses = [
    'активный',
    'неактивный',
  ];

  /// Список автомобилей
  static const List<String> cars = [
    'Dewo Matiz (01KG001XYZ)',
    'Toyota Camry (01KG002ABC)',
    'Honda Civic (01KG003DEF)',
    'Hyundai Elantra (01KG004GHI)',
    'Kia Rio (01KG005JKL)',
  ];

  /// Список владельцев
  static const List<String> owners = [
    'Бердалиев Тилек Уланбекович',
    'Иванов Иван Иванович',
    'Петров Петр Петрович',
    'Сидоров Сидор Сидорович',
    'Козлов Козел Козлович',
  ];

  /// Список пользователей
  static const List<String> users = [
    'Ахмедов Ахмед Ахмедович',
    'Беков Бек Бекович',
    'Газиев Гази Газиевич',
    'Давлетов Давлет Давлетович',
    'Ермаков Ермак Ермакович',
  ];

  /// Список платежных систем
  static const List<String> paymentSystems = [
    'FINIK',
    'VISA',
    'MASTERCARD',
    'ELCARD',
    'BANK_TRANSFER',
  ];

  /// Список ролей
  static const List<String> roles = [
    'Администратор',
    'Менеджер',
    'Оператор',
    'Агент',
    'Клиент',
  ];

  /// Генерация случайного номера полиса
  static String generatePolicyNumber() {
    final random = DateTime.now().millisecondsSinceEpoch % 10000;
    return 'AGIMP${random.toString().padLeft(7, '0')}';
  }

  /// Генерация случайной даты
  static String generateDate() {
    final now = DateTime.now();
    final randomDays = (DateTime.now().millisecondsSinceEpoch % 365);
    final date = now.subtract(Duration(days: randomDays));
    return '${date.day.toString().padLeft(2, '0')}:${date.month.toString().padLeft(2, '0')}:${date.year}';
  }

  /// Генерация случайной суммы
  static String generateAmount() {
    final random = (DateTime.now().millisecondsSinceEpoch % 50000) + 1000;
    return '${(random / 100).toStringAsFixed(2)} c';
  }

  /// Генерация случайного PIN (14 цифр)
  static String generatePin() {
    final random = DateTime.now().millisecondsSinceEpoch;
    return random.toString().padLeft(14, '0').substring(0, 14);
  }

  /// Генерация случайного номера телефона
  static String generatePhoneNumber() {
    final random = DateTime.now().millisecondsSinceEpoch % 1000000000;
    return '+996 555 ${random.toString().padLeft(6, '0').substring(0, 6)}';
  }

  /// Генерация одного объекта данных
  static Map<String, dynamic> generateSingle() {
    final policyType = policyTypes[DateTime.now().millisecondsSinceEpoch % policyTypes.length];
    final status = statuses[DateTime.now().millisecondsSinceEpoch % statuses.length];
    final car = cars[DateTime.now().millisecondsSinceEpoch % cars.length];
    final owner = owners[DateTime.now().millisecondsSinceEpoch % owners.length];
    final user = users[DateTime.now().millisecondsSinceEpoch % users.length];
    final paymentSystem = paymentSystems[DateTime.now().millisecondsSinceEpoch % paymentSystems.length];
    final role = roles[DateTime.now().millisecondsSinceEpoch % roles.length];

    final issueDate = generateDate();
    final amount = generateAmount();
    final premiumAmount = generateAmount();
    final premiumWithoutTax = generateAmount();
    final usedBonuses = generateAmount();
    final earnedBonuses = generateAmount();

    return {
      'policyNumber': generatePolicyNumber(),
      'issueDate': issueDate,
      'validityPeriod': '$issueDate-$issueDate',
      'amount': amount,
      'policyType': policyType,
      'car': car,
      'owner': owner,
      'status': status,
      'user': user,
      'pin': generatePin(),
      'premiumAmount': premiumAmount,
      'premiumWithoutTax': premiumWithoutTax,
      'usedBonuses': usedBonuses,
      'earnedBonuses': earnedBonuses,
      'paymentSystem': paymentSystem,
      'id': (DateTime.now().millisecondsSinceEpoch % 10000).toString(),
      'phoneNumber': generatePhoneNumber(),
      'roles': role,
    };
  }

  /// Генерация списка Map для использования в таблицах
  static List<Map<String, dynamic>> generateMapList(int count) {
    return List.generate(count, (index) => generateSingle());
  }
}
