import 'package:ayu_admin_panel/moduls/reports/view/report_tabs/policy_report/cubit/policy_report_cubit.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyReportView extends StatefulWidget {
  const PolicyReportView({super.key});

  @override
  State<PolicyReportView> createState() => _PolicyReportViewState();
}

class _PolicyReportViewState extends State<PolicyReportView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PolicyReportCubit(context.read<Repository>()),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        
      ],
      ),
    );
  }
}
