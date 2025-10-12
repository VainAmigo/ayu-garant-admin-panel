import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class Filter extends StatefulWidget {
  const Filter({
    super.key,
    this.onFiltersSet,
    this.onFiltersReset,
    this.filtersList,
    this.filterButtonText,
  });

  final void Function()? onFiltersSet;
  final void Function()? onFiltersReset;
  final List<Widget>? filtersList;
  final String? filterButtonText;

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey100),
      ),
      child: Column(
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Фильтры', style: AppTypography.black20w400),
              const Spacer(),
              Row(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  PrimaryButton(
                    text: widget.filterButtonText ?? 'Сформировать',
                    onPressed: widget.onFiltersSet,
                  ),
                  TextButton.icon(
                    onPressed: widget.onFiltersReset,
                    icon: Icon(Icons.refresh, size: 16, color: AppColors.grey),
                    label: Text(
                      'Сбросить',
                      style: TextStyle(fontSize: 12, color: AppColors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),

          Responsive.isDesktop(context)
              ? Row(
                  spacing: AppSpacing.defaultPadding,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.filtersList ?? [],
                )
              : Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: widget.filtersList ?? [],
                ),
        ],
      ),
    );
  }
}
