import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../themes/colors/app_colors.dart';

/// Виджет чипа-пикера диапазона дат в стиле дизайна на макете.
/// Показывает иконку календаря и два плейсхолдера/даты: "дата начала" и "дата окончания".
/// По тапу открывает стандартный `showDateRangePicker`.
class DateRangePickerChip extends StatefulWidget {
  const DateRangePickerChip({
    super.key,
    this.initialStart,
    this.initialEnd,
    this.onChanged,
    this.hintStart = 'дата начала',
    this.hintEnd = 'дата окончания',
    this.firstDate,
    this.lastDate,
    this.borderRadius = 24,
    this.height = 34,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  });

  /// Начальная дата диапазона
  final DateTime? initialStart;

  /// Конечная дата диапазона
  final DateTime? initialEnd;

  /// Колбек при выборе диапазона
  final ValueChanged<DateTimeRange?>? onChanged;

  /// Текст плейсхолдера слева
  final String hintStart;

  /// Текст плейсхолдера справа
  final String hintEnd;

  /// Ограничения календаря (минимальная дата)
  final DateTime? firstDate;

  /// Ограничения календаря (максимальная дата)
  final DateTime? lastDate;

  /// Радиус скругления капсулы
  final double borderRadius;

  /// Высота чипа
  final double height;

  /// Внутренние отступы
  final EdgeInsets padding;

  @override
  State<DateRangePickerChip> createState() => _DateRangePickerChipState();
}

class _DateRangePickerChipState extends State<DateRangePickerChip> {
  DateTime? _start;
  DateTime? _end;

  final DateFormat _dateFormat = DateFormat('dd.MM.yyyy');

  @override
  void initState() {
    super.initState();
    _start = widget.initialStart;
    _end = widget.initialEnd;
  }

  Future<void> _pickRange() async {
    final DateTime firstDate = widget.firstDate ?? DateTime(2000);
    final DateTime lastDate = widget.lastDate ?? DateTime(2100);

    final DateTimeRange? initialRange = (_start != null && _end != null)
        ? DateTimeRange(start: _start!, end: _end!)
        : null;

    final result = await showDateRangePicker(
      context: context,
      firstDate: firstDate,
      lastDate: lastDate,
      initialDateRange: initialRange,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: Theme.of(context).colorScheme.copyWith(
                  primary: AppColors.primary,
                ),
          ),
          child: child!,
        );
      },
    );

    if (!mounted) return;
    if (result != null) {
      setState(() {
        _start = result.start;
        _end = result.end;
      });
      widget.onChanged?.call(result);
    } else {
      widget.onChanged?.call(null);
    }
  }

  void _resetRange() {
    setState(() {
      _start = null;
      _end = null;
    });
    widget.onChanged?.call(null);
  }

  String _format(DateTime? date) => date == null ? '' : _dateFormat.format(date);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: _pickRange,
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: Container(
          height: widget.height,
          padding: widget.padding,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: Border.all(color: AppColors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.calendar_today, size: 18, color: AppColors.grey),
              const SizedBox(width: 8),
              _ValueOrHint(
                value: _format(_start),
                hint: widget.hintStart,
              ),
              const SizedBox(width: 12),
              _DotSeparator(color: AppColors.grey100),
              const SizedBox(width: 12),
              _ValueOrHint(
                value: _format(_end),
                hint: widget.hintEnd,
              ),
              if (_start != null && _end != null) ...[
                const SizedBox(width: 12),
                GestureDetector(
                  onTap: _resetRange,
                  child: Icon(
                    Icons.clear,
                    size: 20,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _ValueOrHint extends StatelessWidget {
  const _ValueOrHint({required this.value, required this.hint});

  final String value;
  final String hint;

  @override
  Widget build(BuildContext context) {
    final TextStyle hintStyle = TextStyle(
      color: AppColors.grey,
      fontSize: 14,
    );
    final TextStyle valueStyle = TextStyle(
      color: AppColors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );

    return Text(
      value.isEmpty ? hint : value,
      style: value.isEmpty ? hintStyle : valueStyle,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    );
  }
}

class _DotSeparator extends StatelessWidget {
  const _DotSeparator({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}


