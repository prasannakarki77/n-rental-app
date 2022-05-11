import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 234, 98, 7),
        primarySwatch: Colors.red),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => const SplashScreen(),
    },
  ));
}
