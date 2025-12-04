import 'package:flutter/foundation.dart';
import 'dart:math' as math;

@immutable
final class PaginationEntity {
  const PaginationEntity({
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  final int total;
  final int limit;
  final int page;
  final int pages;

  bool get hasNext => page < pages;
  bool get hasPrevious => page > 1;

  int get from => total == 0 ? 0 : math.min(((page - 1) * limit) + 1, total);
  int get to => total == 0 ? 0 : math.min(page * limit, total);

  PaginationEntity copyWith({
    int? total,
    int? limit,
    int? page,
    int? pages,
  }) {
    return PaginationEntity(
      total: total ?? this.total,
      limit: limit ?? this.limit,
      page: page ?? this.page,
      pages: pages ?? this.pages,
    );
  }
}

@immutable
final class PaginatedData<T> {
  const PaginatedData({
    required this.items,
    required this.pagination,
  });

  final List<T> items;
  final PaginationEntity pagination;

  PaginatedData<R> map<R>(R Function(T item) mapper) {
    return PaginatedData<R>(
      items: items.map(mapper).toList(),
      pagination: pagination,
    );
  }
}

