import 'package:flutter/material.dart';
import 'package:packages_videos/presentation/routes/routes_names.dart';
import 'package:packages_videos/presentation/views/home.view.dart';
import 'package:packages_videos/presentation/views/home_details.view.dart';

abstract class RoutesMap {
  static Map<String, StatelessWidget Function(BuildContext context)> routes = {
    RoutesNames.home: (_) => const HomeView(),
    RoutesNames.details: (_) => const HomeDetailsView(),
  };
}
