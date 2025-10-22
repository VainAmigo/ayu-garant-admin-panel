import 'dart:developer';

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  final UsersReportParam _defaultParams = UsersReportParam(
    name: null,
    phoneNumber: null,
    role: null,
  );

  @override
  void initState() {
    super.initState();
    context.read<UsersCubit>().getUsers(param: _defaultParams);
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.defaultPadding),
        child: Column(
          spacing: AppSpacing.defaultPadding,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Filter(
              onFiltersSet: () => _onApplyFilter(context),
              onFiltersReset: () => _resetFilters(),
              filtersList: _buildFilterWidgets(),
            ),
            BlocBuilder<UsersCubit, UsersState>(
              builder: (context, state) {
                return switch (state) {
                  UsersInitial() => const CenteredIndicator(),
                  UsersLoading() => const CenteredIndicator(),
                  UsersSuccess() => UsersTableWidget(
                    data: state.users,
                    onExport: _onExport,
                    onEdit: _onEdit,
                    onDelete: _onDelete,
                    onManageRoles: _onManageRoles,
                  ),
                  UsersError() => Center(
                    child: Text('Ошибка загрузки данных: ${state.error}'),
                  ),
                  UsersState() => throw UnimplementedError(),
                };
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onApplyFilter(BuildContext context) {
    final param = UsersReportParam(
      name: _nameController.text,
      phoneNumber: _phoneController.text,
      role: _selectedRole,
    );
    context.read<UsersCubit>().getUsers(param: param);
    log('param: ${param.toBody().toJson()}');
  }

  void _onExport() {}

  void _resetFilters() {
    setState(() {
      _nameController.clear();
      _phoneController.clear();
      _selectedRole = null;
    });
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomSearchBar(controller: _nameController, hintText: 'Имя'),
      CustomSearchBar(controller: _phoneController, hintText: 'Телефон'),
      CustomDropDown<String>(
        items: _roleItems,
        value: _selectedRole,
        onChanged: _onRoleChanged,
      ),
    ];
  }

  final List<DropdownItem<String>> _roleItems = [
    DropdownItem(value: 'all', label: 'Все'),
    DropdownItem(value: 'admin', label: 'Администратор'),
    DropdownItem(value: 'user', label: 'Пользователь'),
    DropdownItem(value: 'avarSpecialist', label: 'Авар специалист'),
    DropdownItem(value: 'accountant', label: 'Бухгалтер'),
  ];

  void _onRoleChanged(String? value) {
    setState(() {
      _selectedRole = value;
    });
  }

  void _onEdit() {
    log('onEdit');
  }

  void _onDelete() {
    log('onDelete');
  }

  void _onManageRoles() {
    log('onManageRoles');
  }
}
