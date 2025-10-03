import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
          children: [
            if (!Responsive.isDesktop(context))
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: context.read<MenuCubit>().controlMenu,
              ),
            if (!Responsive.isMobile(context))
              Text(
                "Dashboard",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            if (!Responsive.isMobile(context))
              Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
            Expanded(child: CustomSearchBar()),
          ],
        ),
    );
  }
}
