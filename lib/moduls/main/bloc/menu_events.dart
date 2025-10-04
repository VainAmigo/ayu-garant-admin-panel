part of 'menu_bloc.dart';

@immutable
sealed class MenuEvent {
  const MenuEvent();
}

@immutable
final class MenuOpenCloseEvent extends MenuEvent {
  const MenuOpenCloseEvent();
}

@immutable
final class PageChangeEvent extends MenuEvent {
  final int page;
  const PageChangeEvent({required this.page});
}
