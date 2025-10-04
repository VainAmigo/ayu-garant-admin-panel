import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/moduls/profile/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppMainView extends StatelessWidget {
  const AppMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (_) => MenuBloc(),
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Responsive.isDesktop(context))
                        Expanded(
                          child: SideMenuWidget(
                            onMenuTap: (index) => onMenuTap(context, index),
                            activeIndex: state.selectedPageIndex,
                          ),
                        ),
                      Expanded(
                        flex: 5,
                        child: _buildCurrentPage(state.selectedPageIndex),
                      ),
                    ],
                  ),
                ),
                if (!Responsive.isDesktop(context) && state.isMenuOpen)
                  _buildOverlayMenu(context, state, width),
              ],
            ),
          );
        },
      ),
    );
  }

  void onMenuTap(BuildContext context, int index) {
    context.read<MenuBloc>().add(PageChangeEvent(page: index));
    if (!Responsive.isDesktop(context)) {
      context.read<MenuBloc>().add(const MenuOpenCloseEvent());
    }
  }

  void toggleMenu(BuildContext context) {
    context.read<MenuBloc>().add(const MenuOpenCloseEvent());
  }

  Widget _buildCurrentPage(int selectedIndex) {
    switch (selectedIndex) {
      case 0:
        return AnalyticView();
      case 1:
        return UsersView();
      case 2:
        return ReportsView();
      case 3:
        return AccountingView();
      case 4:
        return EmergencyCommissionerView();
      case 5:
        return ProfileView();
      default:
        return AnalyticView();
    }
  }

  Widget _buildOverlayMenu(BuildContext context, MenuState state, double width) {
    return AnimatedOpacity(
      opacity: state.isMenuOpen ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          context.read<MenuBloc>().add(const MenuOpenCloseEvent());
        },
        child: Container(
          color: Colors.black.withAlpha(80),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: Responsive.isMobile(context) ? width * 0.5 : width * 0.3,
              height: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: SideMenuWidget(
                onMenuTap: (index) => onMenuTap(context, index),
                activeIndex: state.selectedPageIndex,
              ),
            ),
          ),
        ),
      ),
    );
  }
}