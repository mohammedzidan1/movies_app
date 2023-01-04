import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes/routes_names.dart';
import 'package:movies_app/modules/movise/presentation/screens/movie_detail_screen.dart';
import 'package:movies_app/modules/movise/presentation/screens/movies_screen.dart';

class AppRouts {
  Route? genirateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (_) => const MainMoviesScreen());
      case RoutesName.details:
        int id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) =>  MovieDetailScreen(id: id));
    }
    return null;
  }
}
