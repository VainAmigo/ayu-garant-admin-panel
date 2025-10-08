import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

/// Колонка таблицы
class TableColumn<T> {
  final String title;
  final String Function(T item) dataExtractor;
  final double? width;
  final TextAlign alignment;
  final Widget Function(T item)? customBuilder;

  const TableColumn({
    required this.title,
    required this.dataExtractor,
    this.width,
    this.alignment = TextAlign.left,
    this.customBuilder,
  });
}

/// Кастомная таблица с адаптивным дизайном
class CustomTable<T> extends StatelessWidget {
  final List<TableColumn<T>> columns;
  final List<T> data;
  final bool showHeader;
  final double? height;
  final Color? headerBackgroundColor;
  final Color? rowBackgroundColor;
  final Color? alternateRowBackgroundColor;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BoxBorder? border;
  final bool enableHorizontalScroll;
  final double? minWidth;

  const CustomTable({
    super.key,
    required this.columns,
    required this.data,
    this.showHeader = true,
    this.height,
    this.headerBackgroundColor,
    this.rowBackgroundColor,
    this.alternateRowBackgroundColor,
    this.padding,
    this.borderRadius,
    this.border,
    this.enableHorizontalScroll = true,
    this.minWidth,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Рассчитываем минимальную ширину таблицы
    final calculatedMinWidth = minWidth ?? _calculateMinWidth();
    
    Widget tableWidget = _buildTable();
    
    // Если включен горизонтальный скролл и таблица шире экрана
    if (enableHorizontalScroll && calculatedMinWidth > screenWidth) {
      final scrollController = ScrollController();
      tableWidget = Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        child: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: calculatedMinWidth,
            child: tableWidget,
          ),
        ),
      );
    }
    
    return Container(
      height: height, // Если height не задан, контейнер адаптируется к контенту
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        border: border ?? Border.all(color: AppColors.grey100),
      ),
      child: tableWidget,
    );
  }

  Widget _buildTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showHeader) _buildHeader(),
        _buildBody(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: headerBackgroundColor ?? AppColors.grey100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: Row(
        children: columns.map((column) {
          return Expanded(
            flex: column.width != null ? 0 : 1,
            child: SizedBox(
              width: column.width,
              child: Text(
                column.title,
                style: AppTypography.grey16w500,
                textAlign: column.alignment,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBody() {
    if (data.isEmpty) {
      return const Center(
        child: Text(
          'Нет данных для отображения',
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 16,
          ),
        ),
      );
    }

    return Column(
      children: List.generate(data.length, (index) {
        final item = data[index];
        final isEven = index % 2 == 0;
        
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: isEven 
                ? (alternateRowBackgroundColor ?? AppColors.white)
                : (rowBackgroundColor ?? AppColors.grey100),
              child: Row(
                children: columns.map((column) {
                  return Expanded(
                    flex: column.width != null ? 0 : 1,
                    child: SizedBox(
                      width: column.width,
                      child: column.customBuilder != null
                        ? column.customBuilder!(item)
                        : Text(
                            column.dataExtractor(item),
                            style: AppTypography.grey14w500.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: column.alignment,
                          ),
                    ),
                  );
                }).toList(),
              ),
            ),
            if (index < data.length - 1) const Divider(
              height: 1,
              color: AppColors.grey100,
            ),
          ],
        );
      }),
    );
  }

  double _calculateMinWidth() {
    double totalWidth = 0;
    for (final column in columns) {
      if (column.width != null) {
        totalWidth += column.width!;
      } else {
        // Минимальная ширина для колонки без фиксированной ширины
        totalWidth += 120;
      }
    }
    return totalWidth;
  }
}

/// Виджет для отображения статуса с цветным индикатором
class StatusChip extends StatelessWidget {
  final String status;
  final Color? backgroundColor;
  final Color? textColor;

  const StatusChip({
    super.key,
    required this.status,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor = backgroundColor ?? _getStatusColor(status);
    Color txtColor = textColor ?? AppColors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: AppTypography.white14w500.copyWith(color: txtColor),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'активный':
        return AppColors.green;
      case 'неактивный':
        return AppColors.oragne;
      case 'заблокирован':
        return AppColors.red;
      default:
        return AppColors.grey;
    }
  }
}

/// Виджет для отображения суммы с валютой
class AmountWidget extends StatelessWidget {
  final double amount;
  final String currency;
  final TextStyle? style;

  const AmountWidget({
    super.key,
    required this.amount,
    this.currency = 'c',
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${amount.toStringAsFixed(2)} $currency',
      style: style ?? AppTypography.black20w400.copyWith(fontSize: 14),
    );
  }
}
