import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nrental/screen/about_screen.dart';
import 'package:nrental/screen/dashboard_screen.dart';
import 'package:nrental/screen/login_screen.dart';
import 'package:nrental/screen/search_screen.dart';
import 'package:nrental/screen/testScreen.dart';
import 'screen/register_screen.dart';
import 'screen/splash_screen.dart';

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
        '/aboutScreen': (context) => const AboutScreen(),
      },
    ),
  );
}
