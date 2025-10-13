import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmtyNotificationWidget extends StatelessWidget {
  const EmtyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return WhiteContainer(
      child: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: AppSpacing.defaultPadding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Нет уведомлений'),
              Icon(Icons.notifications_none),
            ],
          ),
        ),
      ),
    );
  }
}
