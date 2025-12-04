import 'package:ayu_admin_panel/services/entities/pagination_entity.dart';
import 'package:flutter/foundation.dart';

typedef JsonMap = Map<String, dynamic>;

@immutable
final class PaginationResponse {
  const PaginationResponse({
    required this.total,
    required this.limit,
    required this.page,
    required this.pages,
  });

  factory PaginationResponse.fromJson(JsonMap? json) {
    if (json == null) {
      return const PaginationResponse(total: 0, limit: 0, page: 1, pages: 1);
    }
    return PaginationResponse(
      total: json['total'] as int? ?? 0,
      limit: json['limit'] as int? ?? 0,
      page: json['page'] as int? ?? 1,
      pages: json['pages'] as int? ?? 1,
    );
  }

  final int total;
  final int limit;
  final int page;
  final int pages;

  PaginationEntity toEntity() {
    return PaginationEntity(
      total: total,
      limit: limit == 0 ? total : limit,
      page: page,
      pages: pages == 0 ? 1 : pages,
    );
  }
}

@immutable
final class PaginatedResponse<T> {
  const PaginatedResponse({
    required this.items,
    required this.pagination,
  });

  factory PaginatedResponse.fromJson(
    JsonMap json, {
    required T Function(JsonMap json) mapper,
    Iterable<String> possibleDataKeys = const ['data', 'items', 'policies'],
  }) {
    final listJson = _extractList(json, possibleDataKeys);
    return PaginatedResponse<T>(
      items: listJson.map((e) => mapper(e as JsonMap)).toList(),
      pagination: PaginationResponse.fromJson(
        json['pagination'] as JsonMap?,
      ),
    );
  }

  final List<T> items;
  final PaginationResponse pagination;

  PaginatedData<R> toEntity<R>(R Function(T model) mapper) {
    return PaginatedData<R>(
      items: items.map(mapper).toList(),
      pagination: pagination.toEntity(),
    );
  }

  static List<dynamic> _extractList(
    JsonMap json,
    Iterable<String> possibleDataKeys,
  ) {
    for (final key in possibleDataKeys) {
      final value = json[key];
      if (value is List<dynamic>) {
        return value;
      }
    }
    return const [];
  }
}

