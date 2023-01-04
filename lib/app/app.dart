import 'package:flutter/material.dart';
import 'package:movies_app/modules/movise/presentation/screens/movies_screen.dart';

import '../core/app_routes/routes_manage.dart';


class MoviesApp extends StatelessWidget {
  const MoviesApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      debugShowCheckedModeBanner: false,
       onGenerateRoute: AppRouts().genirateRoute,

    );
  }
}
