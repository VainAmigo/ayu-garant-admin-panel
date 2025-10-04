part of 'menu_bloc.dart';

@immutable
class MenuState {
  final int selectedPageIndex;
  final bool isMenuOpen;

  const MenuState({
    this.selectedPageIndex = 0,
    this.isMenuOpen = false,
  });

  MenuState copyWith({
    int? selectedPageIndex,
    bool? isMenuOpen,
  }) {
    return MenuState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
      isMenuOpen: isMenuOpen ?? this.isMenuOpen,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MenuState &&
        other.selectedPageIndex == selectedPageIndex &&
        other.isMenuOpen == isMenuOpen;
  }

  @override
  int get hashCode => selectedPageIndex.hashCode ^ isMenuOpen.hashCode;
}
