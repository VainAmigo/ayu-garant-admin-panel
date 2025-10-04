import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AccountingView extends StatelessWidget {
  const AccountingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance,
              size: 64,
              color: AppColors.grey,
            ),
            const SizedBox(height: 16),
            Text(
              'Accounting Page',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Страница учета будет здесь',
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
