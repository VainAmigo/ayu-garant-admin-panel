import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'menu_events.dart';
part 'menu_states.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(const MenuState()) {
    on<MenuOpenCloseEvent>(_onMenuOpenCloseEvent);
    on<PageChangeEvent>(_onPageChangeEvent);
  }

  void _onMenuOpenCloseEvent(
    MenuOpenCloseEvent event,
    Emitter<MenuState> emit,
  ) {
    emit(state.copyWith(isMenuOpen: !state.isMenuOpen));
  }

  void _onPageChangeEvent(
    PageChangeEvent event,
    Emitter<MenuState> emit,
  ) {
    emit(state.copyWith(selectedPageIndex: event.page));
  }
}
