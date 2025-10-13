import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListNotificationWidget extends StatefulWidget {
  const ListNotificationWidget({super.key});

  @override
  State<ListNotificationWidget> createState() => _ListNotificationWidgetState();
}

class _ListNotificationWidgetState extends State<ListNotificationWidget> {
  final NotificationListParam _defaultParams = NotificationListParam(id: '');

  @override
  void initState() {
    super.initState();
    context.read<NotificationCubit>().getNotificationList(
      param: _defaultParams,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          switch (state) {
            case NotificationLoading():
              return const Center(child: CircularProgressIndicator());
            case NotificationListSuccess():
              return ListView.builder(
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return NotificationCardWidget(
                    notification: state.data[index],
                    onStop: () {
                      _onStop(state.data[index].id);
                    },
                    onDelete: () {
                      _onDelete(state.data[index].id);
                    },
                  );
                },
              );
            default:
              return const EmtyNotificationWidget();
          }
        },
      ),
    );
  }

  void _onStop(String id) {
    context.read<NotificationCubit>().controlNotification(
      param: NotificationControlParam(
        id: id,
        newStatus: NotificationStatus.paused,
      ),
    );
    context.read<NotificationCubit>().getNotificationList(
      param: _defaultParams,
    );
  }

  void _onDelete(String id) {
    context.read<NotificationCubit>().controlNotification(
      param: NotificationControlParam(
        id: id,
        newStatus: NotificationStatus.stopped,
      ),
    );
    context.read<NotificationCubit>().getNotificationList(
      param: _defaultParams,
    );
  }
}
