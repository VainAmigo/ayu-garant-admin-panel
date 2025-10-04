import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({super.key, this.onMenuTap, this.activeIndex = 0});

  final Function(int)? onMenuTap;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.defaultPadding,
        AppSpacing.defaultPadding,
        0,
        AppSpacing.defaultPadding,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(width > 1300 ? AppSpacing.defaultPadding : 5),
        child: ListView(
          children: [
            DrawerHeader(child: Image.asset("assets/images/ayu_logo.png")),
            DrawerListTile(
              title: "Analytics",
              svgSrc: "assets/icons/icon_analytics.svg",
              press: () => onMenuTap?.call(0),
              isActive: activeIndex == 0,
            ),
            DrawerListTile(
              title: "Users",
              svgSrc: "assets/icons/icon_persons.svg",
              press: () => onMenuTap?.call(1),
              isActive: activeIndex == 1,
            ),
            DrawerListTile(
              title: "Report",
              svgSrc: "assets/icons/icon_reports.svg",
              press: () => onMenuTap?.call(2),
              isActive: activeIndex == 2,
            ),
            DrawerListTile(
              title: "Acounting",
              svgSrc: "assets/icons/icon_acounting.svg",
              press: () => onMenuTap?.call(3),
              isActive: activeIndex == 3,
            ),
            DrawerListTile(
              title: "Avar",
              svgSrc: "assets/icons/icon_avar.svg",
              press: () => onMenuTap?.call(4),
              isActive: activeIndex == 4,
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/icon_person.svg",
              press: () => onMenuTap?.call(5),
              isActive: activeIndex == 5,
            ),
            DrawerListTile(
              title: "Exit",
              svgSrc: "assets/icons/icon_exit.svg",
              press: () => _logOut,
              isActive: false,
            ),
          ],
        ),
      ),
    );
  }
}

void _logOut() {}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
    this.isActive = false,
  });

  final String title, svgSrc;
  final VoidCallback press;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final textColor = isActive ? AppColors.primary : AppColors.grey;
    final iconColor = isActive ? AppColors.primary : AppColors.grey;

    return ListTile(
      onTap: press,
      horizontalTitleGap: 15.0,
      leading: SvgPicture.asset(svgSrc, color: iconColor, height: 16),
      title: Text(title, style: TextStyle(color: textColor)),
    );
  }
}
