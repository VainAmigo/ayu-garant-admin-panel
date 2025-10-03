import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MenuCubit extends Cubit<GlobalKey<ScaffoldState>> {
  MenuCubit() : super(GlobalKey<ScaffoldState>());

  void controlMenu() {
    if (!state.currentState!.isDrawerOpen) {
      state.currentState!.openDrawer();
    }
  }
}
