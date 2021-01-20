import 'package:flutter/material.dart';
import 'resources/routes.dart';
import 'resources/custom_router.dart';

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'WIDGETS TEST',
        theme: ThemeData(
          primaryColor: Colors.blue.shade900,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: NavigationRoutes.generateRoute,
        initialRoute: homeRoute,
      );
  }
}
