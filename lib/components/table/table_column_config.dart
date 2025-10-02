import 'package:flutter/material.dart';

/// Конфигурация колонки таблицы
class TableColumnConfig {
  final String key;
  final String title;
  final double? width;
  final Widget Function(dynamic data)? customBuilder;

  const TableColumnConfig({
    required this.key,
    required this.title,
    this.width,
    this.customBuilder,
  });
}

/// Конфигурация таблицы
class TableConfig {
  final List<TableColumnConfig> columns;

  const TableConfig({
    required this.columns,
  });
}
