import 'package:flutter/material.dart';
import 'package:rocket_fox_web/functions/auth/presentation/view_models/screens/auth_screen.dart';

import 'functions/rocket_fox/Resources/strings.dart';
import 'functions/rocket_fox/Routes/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
      initialRoute: Str.home,
      onGenerateRoute: AppRoute().generateRoute,
    );
  }
}
