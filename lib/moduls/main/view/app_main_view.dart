import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AppMainView extends StatefulWidget {
  const AppMainView({super.key});

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  int _selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(
        onPageSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        elevation: 0,
        title: const Text("AYU Admin Panel"),
        centerTitle: false,
        actionsPadding: EdgeInsets.symmetric(horizontal: AppSpacing.defaultPadding,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.grey),
          ),
        ],
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
      ),
      body: _buildCurrentPage(_selectedIndex),
    );
  }
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
