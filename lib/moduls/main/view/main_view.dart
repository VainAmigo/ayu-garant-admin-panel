import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AppMain extends StatefulWidget {
  const AppMain({super.key});

  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AnalyticView(),
    const ReportView(),
  ];

  final List<String> _pageTitles = [
    'Аналитика',
    'Отчеты',
    'Пользователи',
    'Бухгалтерия',
    'Аварийный комисар',
    'Профиль',
  ];

  void _onItemSelected(int index) {
    if (index == 6) {
      // Обработка выхода
      _showLogoutDialog();
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Выход'),
          content: const Text('Вы уверены, что хотите выйти?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Отмена'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Здесь можно добавить логику выхода
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Выход выполнен')),
                );
              },
              child: const Text('Выйти'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: CustomAppBar(
        title: _pageTitles[_selectedIndex],
      ),
      drawer: CustomDrawer(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemSelected,
      ),
      body: _pages[_selectedIndex],
    );
  }
}
