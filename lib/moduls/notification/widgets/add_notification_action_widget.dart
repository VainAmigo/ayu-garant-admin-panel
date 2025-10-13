import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/services/services.dart' as services;
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AddNotificationActionWidget extends StatefulWidget {
  const AddNotificationActionWidget({super.key, required this.onSave});

  final Function(
    String? title,
    String? body,
    services.NotificationType? type,
    DateTime? date,
    String? time,
    services.DotWeekday? weekday,
  )
  onSave;

  @override
  State<AddNotificationActionWidget> createState() =>
      _AddNotificationActionWidgetState();
}

class _AddNotificationActionWidgetState
    extends State<AddNotificationActionWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  services.NotificationType _notificationType = services.NotificationType.single;
  TimeOfDay? _selectedTime;
  DateTime? _selectedDate;
  services.DotWeekday? _selectedWeekday;

  @override
  void dispose() {
    _titleController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomTextField(
          controller: _titleController,
          hintText: 'Введите заголовок уведомления',
          maxLines: 2,
          width: double.infinity,
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: _textController,
          hintText: 'Введите текст уведомления',
          maxLines: 5,
          width: double.infinity,
        ),

        const SizedBox(height: AppSpacing.defaultPadding),

        DefaultTabController(
          length: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: AppSpacing.defaultPadding,
            children: [
              TabBar(
                labelColor: AppColors.primary,
                unselectedLabelColor: AppColors.grey,
                indicatorColor: AppColors.primary,
                onTap: (index) {
                  setState(() {
                    _notificationType = services.NotificationType.values[index];
                  });
                },
                tabs: [
                  Tab(text: 'Один раз'),
                  Tab(text: 'Еженедельно'),
                  Tab(text: 'Ежемесячно'),
                ],
              ),
              SizedBox(
                height: 180,
                child: TabBarView(
                  children: [
                    _buildSingleNotification(),
                    _buildWeeklyNotification(),
                    _buildMonthlyNotification(),
                  ],
                ),
              ),
            ],
          ),
        ),
        PrimaryButton(text: 'Сохранить', onPressed: _onSavePressed),
      ],
    );
  }

  Widget _buildSingleNotification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.defaultPadding,
      children: [
        _buildTile(
          'Время уведомления',
          TimePickerWidget(
            onTimeChanged: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
        ),
        _buildTile(
          'Дата уведомления',
          DatePicker(
            hintText: 'Введите дату уведомления',
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyNotification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.defaultPadding,
      children: [
        _buildTile(
          'Время уведомления',
          TimePickerWidget(
            onTimeChanged: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
        ),
        _buildTile(
          'День недели',
          DotWeekdayPicker(onWeekdaySelected: _onWeekdaySelected),
        ),
      ],
    );
  }

  Widget _buildMonthlyNotification() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: AppSpacing.defaultPadding,
      children: [
        _buildTile(
          'Время уведомления',
          TimePickerWidget(
            onTimeChanged: (time) {
              setState(() {
                _selectedTime = time;
              });
            },
          ),
        ),
        _buildTile(
          'Дата уведомления',
          DatePicker(
            hintText: 'Введите дату уведомления',
            onDateChanged: (date) {
              setState(() {
                _selectedDate = date;
              });
            },
          ),
        ),
      ],
    );
  }

  void _onWeekdaySelected(DotWeekday weekday) {
    setState(() {
      _selectedWeekday = _convertToServicesDotWeekday(weekday);
    });
  }

  services.DotWeekday _convertToServicesDotWeekday(DotWeekday weekday) {
    switch (weekday) {
      case DotWeekday.monday:
        return services.DotWeekday.monday;
      case DotWeekday.tuesday:
        return services.DotWeekday.tuesday;
      case DotWeekday.wednesday:
        return services.DotWeekday.wednesday;
      case DotWeekday.thursday:
        return services.DotWeekday.thursday;
      case DotWeekday.friday:
        return services.DotWeekday.friday;
      case DotWeekday.saturday:
        return services.DotWeekday.saturday;
      case DotWeekday.sunday:
        return services.DotWeekday.sunday;
    }
  }

  void _onSavePressed() {
    // Проверка заполненности основных полей
    if (_titleController.text.trim().isEmpty) {
      _showErrorSnackBar('Заголовок уведомления не может быть пустым');
      return;
    }
    
    if (_textController.text.trim().isEmpty) {
      _showErrorSnackBar('Текст уведомления не может быть пустым');
      return;
    }

    // Проверка в зависимости от типа уведомления
    switch (_notificationType) {
      case services.NotificationType.single:
        if (_selectedTime == null) {
          _showErrorSnackBar('Выберите время уведомления');
          return;
        }
        if (_selectedDate == null) {
          _showErrorSnackBar('Выберите дату уведомления');
          return;
        }
        break;
      case services.NotificationType.weekly:
        if (_selectedTime == null) {
          _showErrorSnackBar('Выберите время уведомления');
          return;
        }
        if (_selectedWeekday == null) {
          _showErrorSnackBar('Выберите день недели');
          return;
        }
        break;
      case services.NotificationType.monthly:
        if (_selectedTime == null) {
          _showErrorSnackBar('Выберите время уведомления');
          return;
        }
        if (_selectedDate == null) {
          _showErrorSnackBar('Выберите дату уведомления');
          return;
        }
        break;
    }

    widget.onSave(
      _titleController.text.trim(),
      _textController.text.trim(),
      _notificationType,
      _selectedDate,
      _selectedTime?.format(context) ?? '',
      _selectedWeekday,
    );
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _buildTile(String title, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(title, style: AppTypography.black16w600),
        child,
      ],
    );
  }
}
