import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/routes/routes_map.dart';
import 'presentation/routes/routes_names.dart';
import 'presentation/providers/retrofit.provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<RetrofitProvider>(
          create: (_) => RetrofitProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Retrofit Review',
        initialRoute: RoutesNames.home,
        routes: RoutesMap.routes,
      ),
    );
  }
}
