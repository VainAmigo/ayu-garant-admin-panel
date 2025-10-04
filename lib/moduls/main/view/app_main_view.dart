import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppMainView extends StatelessWidget {
  const AppMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MenuCubit(),
      child: BlocBuilder<MenuCubit, GlobalKey<ScaffoldState>>(
        builder: (context, scaffoldKey) {
          return Scaffold(
            key: scaffoldKey,
            drawer: SideMenuWidget(),
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (Responsive.isDesktop(context))
                    Expanded(
                      child: SideMenuWidget(),
                    ),
                  Expanded(
                    flex: 5,
                    child: AnalyticView(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

