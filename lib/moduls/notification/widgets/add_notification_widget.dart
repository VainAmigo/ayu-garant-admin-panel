import 'dart:developer' show log;

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart' as services;
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNotificationWidget extends StatelessWidget {
  const AddNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.defaultPadding,
      children: [
        // top container
        WhiteContainer(
          child: Column(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Управление уведомлениями',
                style: AppTypography.black32w600,
              ),
              if (!Responsive.isDesktop(context))
                PrimaryButton(
                  text: 'Добавить уведомление',
                  onPressed: () => _onAddNotificationPressed(context),
                ),
            ],
          ),
        ),

        // bottom container
        if (Responsive.isDesktop(context))
          _buildAddNotificationContainer(context),
      ],
    );
  }

  Widget _buildAddNotificationContainer(BuildContext context) {
    return WhiteContainer(
      width: double.infinity,
      child: Column(
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Новое уведомление', style: AppTypography.black20w400),
          AddNotificationActionWidget(
            onSave: (title, body, type, date, time, weekday) => 
              _onSaveNotificationPressed(context, title, body, type, date, time, weekday),
          ),
        ],
      ),
    );
  }

  void _onAddNotificationPressed(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => _buildAddNotificationContainer(context),
    );
  }

  void _onSaveNotificationPressed(
    BuildContext context,
    String? title,
    String? body,
    services.NotificationType? type,
    DateTime? date,
    String? time,
    services.DotWeekday? weekday,
  ) {
    if (title == null || body == null || type == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Заполните все обязательные поля')),
      );
      return;
    }

    final services.AddNotificationParam param = services.AddNotificationParam(
      title: title,
      body: body,
      type: type,
      date: date,
      time: time,
      weekday: weekday,
    );

    log('------- ${title}');
    log('------- ${body}');
    log('------- ${type}');
    log('------- ${date}');
    log('------- ${time}');
    log('------- ${weekday}');

    final bloc = context.read<NotificationCubit>();
    bloc.addNotification(param: param);
  }
}
