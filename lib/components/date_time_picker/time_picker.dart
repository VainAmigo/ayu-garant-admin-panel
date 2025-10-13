import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class TimePickerWidget extends StatefulWidget {
  final TimeOfDay? initialTime;
  final ValueChanged<TimeOfDay?>? onTimeChanged;
  final String? labelText;
  final String? hintText;
  final Function()? onReset;

  const TimePickerWidget({
    super.key,
    this.initialTime,
    this.onTimeChanged,
    this.labelText,
    this.hintText,
    this.onReset,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay? _selectedTime;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedTime = widget.initialTime;
    if (_selectedTime != null) {
      _controller.text = _formatTime(_selectedTime!);
    }
  }

  @override
  void didUpdateWidget(TimePickerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialTime != oldWidget.initialTime) {
      _selectedTime = widget.initialTime;
      if (_selectedTime != null) {
        _controller.text = _formatTime(_selectedTime!);
      } else {
        _controller.clear();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  void _resetTime() {
    setState(() {
      _selectedTime = null;
      _controller.clear();
    });
    widget.onReset?.call();
    widget.onTimeChanged?.call(null);
  }

  Future<void> _pickTime(BuildContext context) async {
    final now = TimeOfDay.now();
    final result = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (result != null && result != _selectedTime) {
      setState(() {
        _selectedTime = result;
        _controller.text = _formatTime(result);
      });
      widget.onTimeChanged?.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null) ...[
          Text(
            widget.labelText!,
            style: AppTypography.grey14w500,
          ),
          const SizedBox(height: 8),
        ],
        GestureDetector(
          onTap: () => _pickTime(context),
          child: Container(
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: AppColors.grey),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.access_time,
                  color: AppColors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  _controller.text.isEmpty 
                      ? (widget.hintText ?? 'Выберите время')
                      : _controller.text,
                  style: _controller.text.isEmpty 
                      ? AppTypography.grey14w500
                      : AppTypography.black20w400.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 8),
                if (_controller.text.isNotEmpty) ...[
                  GestureDetector(
                    onTap: _resetTime,
                    child: const Icon(
                      Icons.close,
                      color: AppColors.grey,
                      size: 16,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }
}
