import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({
    super.key,
    required this.notification,
    this.onStop,
    this.onDelete,
  });

  final NotificationListEntity notification;
  final Function()? onStop;
  final Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.defaultPadding),
      child: WhiteContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSpacing.defaultPadding,
          children: [_buildActionTitle(), _buildBottomRow()]),
      ),
    );
  }

  Widget _buildBottomRow() {
    return Row(
      spacing: 20,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.grey100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.notifications, color: AppColors.primary),
        ),
        Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.title, style: AppTypography.black20w400), Text(notification.body, style: AppTypography.grey14w500),
          ],
        ),
      ],
    );
  }

  Widget _buildActionTitle() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (notification.isSingle)
          Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationTagWidget(text: notification.date?.formatted),
              NotificationTagWidget(text: notification.time.toString()),
            ],
          ),
        if (notification.isWeekly)
          Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationTagWidget(text: notification.weekday?.name),
              NotificationTagWidget(text: notification.time.toString()),
              NotificationTagWidget(icon: Icons.repeat),
            ],
          ),
        if (notification.isMonthly)
          Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NotificationTagWidget(text: notification.date?.formatted),
              NotificationTagWidget(text: notification.time.toString()),
              NotificationTagWidget(icon: Icons.repeat),
            ],
          ),

        _buildActionRow(),
      ],
    );
  }

  Widget _buildActionRow() {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        NotificationTagWidget(
          text: notification.isActive
              ? 'активно'
              : notification.isPaused
              ? 'паушено'
              : 'остановлено',
          backgroundColor: notification.isActive
              ? AppColors.green.withAlpha(50)
              : notification.isPaused
              ? AppColors.oragne.withAlpha(50)
              : AppColors.red.withAlpha(50),
          textColor: notification.isActive
              ? AppColors.green
              : notification.isPaused
              ? AppColors.oragne
              : AppColors.red,
        ),
        NotificationTagWidget(
          icon: Icons.stop,
          backgroundColor: AppColors.oragne.withAlpha(50),
          textColor: AppColors.oragne,
          onTap: onStop,
        ),
        NotificationTagWidget(
          icon: Icons.delete,
          backgroundColor: AppColors.red.withAlpha(50),
          textColor: AppColors.red,
          onTap: onDelete,
        ),
      ],
    );
  }
}
