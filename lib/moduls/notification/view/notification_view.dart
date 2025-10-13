import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.defaultPadding),
        child: Responsive(
          mobile: NotificationMobileView(),
          desktop: NotificationDesktopView(),
        ),
      ),
    );
  }
}

class NotificationMobileView extends StatelessWidget {
  const NotificationMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: AppSpacing.defaultPadding,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AddNotificationWidget(),
        ListNotificationWidget()
      ],
    );
  }
}

class NotificationDesktopView extends StatelessWidget {
  const NotificationDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSpacing.defaultPadding,
      children: [
        Expanded(
          flex: 1,
          child: AddNotificationWidget(),
        ),
        Expanded(
          flex: 2,
          child: ListNotificationWidget(),
        ),
      ],
    );
  }
}


