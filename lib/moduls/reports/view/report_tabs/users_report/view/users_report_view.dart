import 'dart:developer';

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserReportView extends StatefulWidget {
  const UserReportView({super.key});

  @override
  State<UserReportView> createState() => _UserReportViewState();
}

class _UserReportViewState extends State<UserReportView> {
  final ReportParam _defaultParams = ReportParam(dateRange: PeriodFilter.day.name);

  @override
  void initState() {
    super.initState();
    context.read<ReportCubit>().getReport(param: _defaultParams);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [Text('User Report')],);
  }
}