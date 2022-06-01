import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nrental/screens/dashboard_screen.dart';
import 'package:nrental/screens/login_screen.dart';
import 'package:nrental/screens/search_screen.dart';
import 'package:nrental/screens/testScreen.dart';
import 'screens/register_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 234, 98, 7),
          primarySwatch: Colors.red),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/registerScreen': (context) => const RegisterScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/dashboardScreen': (context) => const DashboardScreem(),
        '/testScreen': (context) => const TestScreen(),
        '/searchScreen': (context) => const SearchScreen(),
      },
    ),
  );
}
