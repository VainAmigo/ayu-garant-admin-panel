import 'package:flutter/material.dart';
import 'package:ayu_admin_panel/themes/themes.dart';

class CustomDrawer extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomDrawer({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.transparent,
      child: Column(
        children: [
          _buildMenuSection(
            menuList: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.analytics_outlined,
                  title: 'Аналитика',
                  index: 0,
                ),
                _buildMenuItem(
                  icon: Icons.assignment_outlined,
                  title: 'Отчеты',
                  index: 1,
                ),
                _buildMenuItem(
                  icon: Icons.people_outline,
                  title: 'Пользователи',
                  index: 2,
                ),
                _buildMenuItem(
                  icon: Icons.bar_chart_outlined,
                  title: 'Бухгалтерия',
                  index: 3,
                ),
                _buildMenuItem(
                  icon: Icons.car_repair_outlined,
                  title: 'Аварийный комисар',
                  index: 4,
                ),
              ],
            ),
          ),
          _buildMenuSection(
            menuList: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.person_outline,
                  title: 'Профиль',
                  index: 5,
                ),
                _buildMenuItem(
                  icon: Icons.logout_outlined,
                  title: 'Выход',
                  index: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection({required Widget menuList}) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: menuList,
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required int index,
  }) {
    final isSelected = selectedIndex == index;

    return Material(
      color: isSelected ? AppColors.primary.withAlpha(30) : Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: () => onItemSelected(index),
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.primary : AppColors.grey,
                size: 24,
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : AppColors.grey,
                    fontSize: 16,
                    fontWeight: isSelected
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
