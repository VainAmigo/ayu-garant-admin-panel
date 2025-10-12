import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.onDateChanged,
    this.hintText,
    this.labelText,
    this.onReset,
  });

  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime?)? onDateChanged;
  final Function()? onReset;
  final String? hintText;
  final String? labelText;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime? _selectedDate;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
    if (_selectedDate != null) {
      _controller.text = DateFormat('dd.MM.yyyy').format(_selectedDate!);
    }
  }

  @override
  void didUpdateWidget(DatePicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialDate != oldWidget.initialDate) {
      _selectedDate = widget.initialDate;
      if (_selectedDate != null) {
        _controller.text = DateFormat('dd.MM.yyyy').format(_selectedDate!);
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

  void _resetDate() {
    setState(() {
      _selectedDate = null;
      _controller.clear();
    });
    widget.onReset?.call();
    widget.onDateChanged?.call(null);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: widget.firstDate ?? DateTime(1900),
      lastDate: widget.lastDate ?? DateTime(2100),
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

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _controller.text = DateFormat('dd.MM.yyyy').format(picked);
      });
      widget.onDateChanged?.call(picked);
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
          onTap: () => _selectDate(context),
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
                  Icons.calendar_today,
                  color: AppColors.grey,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  _controller.text.isEmpty 
                      ? (widget.hintText ?? 'Выберите дату')
                      : _controller.text,
                  style: _controller.text.isEmpty 
                      ? AppTypography.grey14w500
                      : AppTypography.black20w400.copyWith(fontSize: 14),
                ),
                const SizedBox(width: 8),
                if (_controller.text.isNotEmpty) ...[
                  GestureDetector(
                    onTap: _resetDate,
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
