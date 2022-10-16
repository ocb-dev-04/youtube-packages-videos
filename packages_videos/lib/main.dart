import 'package:flutter/material.dart';
import 'package:packages_videos/home.view.dart';

import 'example_code.view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'AppName',
      home: ExampleHomePage(),
      // home: HomeView(),
    );
  }
}
