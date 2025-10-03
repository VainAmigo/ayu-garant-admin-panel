import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(20),
      child: Drawer(
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.asset("assets/images/ayu_logo.png"),
            ),
            DrawerListTile(
              title: "Analytics",
              svgSrc: "assets/icons/icon_analytics.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Users",
              svgSrc: "assets/icons/icon_persons.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Report",
              svgSrc: "assets/icons/icon_report.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Acounting",
              svgSrc: "assets/icons/icon_acounting.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Avar",
              svgSrc: "assets/icons/icon_avar.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Profile",
              svgSrc: "assets/icons/icon_person.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Exit",
              svgSrc: "assets/icons/icon_exit.svg",
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.svgSrc,
    required this.press,
  });

  final String title, svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 15.0,
      leading: SvgPicture.asset(
        svgSrc,
        colorFilter: ColorFilter.mode(AppColors.grey, BlendMode.dstIn),
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColors.grey),
      ),
    );
  }
}
