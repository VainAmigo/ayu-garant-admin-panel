import 'package:flutter/material.dart';
import 'dot_tag.dart';

enum PeriodFilter {
  day,
  week,
  month,
  year,
  all,
}

class DotTagFilter extends StatefulWidget {
  const DotTagFilter({
    super.key,
    required this.onPeriodChanged,
    this.initialPeriod = PeriodFilter.all,
  });

  final Function(PeriodFilter) onPeriodChanged;
  final PeriodFilter initialPeriod;

  @override
  State<DotTagFilter> createState() => _DotTagFilterState();
}

class _DotTagFilterState extends State<DotTagFilter> {
  late PeriodFilter _selectedPeriod;

  @override
  void initState() {
    super.initState();
    _selectedPeriod = widget.initialPeriod;
  }

  void _onPeriodSelected(PeriodFilter period) {
    setState(() {
      _selectedPeriod = period;
    });
    widget.onPeriodChanged(period);
  }

  String _getPeriodText(PeriodFilter period) {
    switch (period) {
      case PeriodFilter.day:
        return 'Д';
      case PeriodFilter.week:
        return 'Н';
      case PeriodFilter.month:
        return 'М';
      case PeriodFilter.year:
        return 'Г';
      case PeriodFilter.all:
        return 'В';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: PeriodFilter.values.map((period) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: GestureDetector(
            onTap: () => _onPeriodSelected(period),
            child: DotTag(
              isSelected: _selectedPeriod == period,
              text: _getPeriodText(period),
            ),
          ),
        );
      }).toList(),
    );
  }
}
