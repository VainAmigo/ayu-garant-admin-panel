import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SideMenuWidget extends StatelessWidget {
  final Function(int)? onPageSelected;

  const SideMenuWidget({super.key, this.onPageSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      child: Drawer(
        elevation: 0,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: AppColors.white),
              child: Center(
                child: Image.asset(
                  'assets/images/ayu_logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_analytics.svg',
              title: 'Аналитика',
              onTap: () => _selectPage(context, 0),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_person.svg',
              title: 'Пользователи',
              onTap: () => _selectPage(context, 1),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_reports.svg',
              title: 'Отчеты',
              onTap: () => _selectPage(context, 2),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_accounting.svg',
              title: 'Бухгалтерия',
              onTap: () => _selectPage(context, 3),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_avar.svg',
              title: 'Аварийный комиссар',
              onTap: () => _selectPage(context, 4),
            ),
            _buildMenuItem(
              context,
              icon: 'assets/icons/icon_person.svg',
              title: 'Профиль',
              onTap: () => _selectPage(context, 5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: SvgPicture.asset(
        icon,
        width: 24,
        height: 24,
        colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.srcIn),
      ),
      title: Text(title),
      onTap: onTap,
    );
  }

  void _selectPage(BuildContext context, int index) {
    Navigator.pop(context);
    if (onPageSelected != null) {
      onPageSelected!(index);
    }
  }
}
