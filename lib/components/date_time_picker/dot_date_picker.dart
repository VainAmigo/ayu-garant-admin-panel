import 'package:flutter/material.dart';

enum DotPeriod {
  day,
  week,
  month,
  year,
  all,
}

enum DotWeekday {
  monday,
  tuesday,
  wednesday,
  thursday,
  friday,
  saturday,
  sunday,
}

class DotPeriodPicker extends StatefulWidget {
  final Function(DotPeriod) onPeriodSelected;
  final DotPeriod initialPeriod;

  const DotPeriodPicker({
    super.key,
    required this.onPeriodSelected,
    this.initialPeriod = DotPeriod.day,
  });

  @override
  State<DotPeriodPicker> createState() => _DotPeriodPickerState();
}

class _DotPeriodPickerState extends State<DotPeriodPicker> {
  late DotPeriod _selectedPeriod;

  @override
  void initState() {
    super.initState();
    _selectedPeriod = widget.initialPeriod;
  }

  String _getPeriodText(DotPeriod period) {
    switch (period) {
      case DotPeriod.day:
        return 'д';
      case DotPeriod.week:
        return 'н';
      case DotPeriod.month:
        return 'м';
      case DotPeriod.year:
        return 'г';
      case DotPeriod.all:
        return 'все';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: DotPeriod.values.map((period) {
        final isSelected = _selectedPeriod == period;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedPeriod = period;
              });
              widget.onPeriodSelected(period);
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 1.5,
                ),
              ),
              width: 36,
              height: 36,
              alignment: Alignment.center,
              child: Text(
                _getPeriodText(period),
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

class DotWeekdayPicker extends StatefulWidget {
  final Function(DotWeekday) onWeekdaySelected;
  final DotWeekday? initialSelected;

  const DotWeekdayPicker({
    Key? key,
    required this.onWeekdaySelected,
    this.initialSelected,
  }) : super(key: key);

  @override
  State<DotWeekdayPicker> createState() => _DotWeekdayPickerState();
}

class _DotWeekdayPickerState extends State<DotWeekdayPicker> {
  DotWeekday? _selectedDay;

  static const Map<DotWeekday, String> _weekdayShort = {
    DotWeekday.monday: 'Пн',
    DotWeekday.tuesday: 'Вт',
    DotWeekday.wednesday: 'Ср',
    DotWeekday.thursday: 'Чт',
    DotWeekday.friday: 'Пт',
    DotWeekday.saturday: 'Сб',
    DotWeekday.sunday: 'Вс',
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = widget.initialSelected;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: DotWeekday.values.map((day) {
        final isSelected = _selectedDay == day;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = day;
              });
              widget.onWeekdaySelected(day);
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.blue : Colors.grey,
                  width: 1.2,
                ),
              ),
              width: 32,
              height: 32,
              alignment: Alignment.center,
              child: Text(
                _weekdayShort[day]!,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.grey[700],
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}

