import 'package:flutter/material.dart';
import 'package:ayu_admin_panel/themes/themes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: 80,
              color: AppColors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Страница профиля',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Здесь будет информация о профиле пользователя',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
