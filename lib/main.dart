import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/network/bloc_server.dart';
import 'core/services/services_locator.dart';

void main() {
  ServicesLocator.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MoviesApp());
}
