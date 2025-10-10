import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class UsersActionsWidget extends StatelessWidget {
  const UsersActionsWidget({
    this.onEdit,
    this.onDelete,
    this.onManageRoles,
    super.key,
  });

  final Function()? onEdit;
  final Function()? onDelete;
  final Function()? onManageRoles;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TagTextButton(
          text: 'редактировать',
          color: AppColors.primary,
          textColor: AppColors.primary,
          onPressed: onEdit ?? () {},
        ),
        TagTextButton(
          text: 'управление ролями',
          color: AppColors.oragne,
          textColor: AppColors.oragne,
          onPressed: onManageRoles ?? () {},
        ),
        TagTextButton(
          text: 'удалить',
          color: AppColors.red,
          textColor: AppColors.red,
          onPressed: onDelete ?? () {},
        ),
      ],
    );
  }
}
