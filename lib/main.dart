import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nrental/screen/about_screen.dart';
import 'package:nrental/screen/article_details_screen.dart';
import 'package:nrental/screen/article_screen.dart';
import 'package:nrental/screen/booking_screen.dart';
import 'package:nrental/screen/dashboard_screen.dart';
import 'package:nrental/screen/login_screen.dart';
import 'package:nrental/screen/profile_screen.dart';
import 'package:nrental/screen/search_screen.dart';
import 'package:nrental/screen/splash_screen.dart';
import 'package:nrental/screen/testScreen.dart';
import 'package:nrental/screen/vehicle_screen.dart';
import 'package:nrental/wearos_screen/wearos_dashboard_screen.dart';
import 'screen/register_screen.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/launcher',
    [
      NotificationChannel(
        channelGroupKey: 'basic_channel_group',
        channelKey: 'basic_channel',
        channelName: 'Basic notification',
        channelDescription: "Notification channel for basic text",
        defaultColor: Colors.red,
        importance: NotificationImportance.Max,
        ledColor: Colors.red,
        channelShowBadge: true,
      ),
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 234, 98, 7),
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // '/': (context) => const WearOSLoginScreen(),
        '/wearosDashboardScreen': (context) => const WearOSDashboardScreen(),
        '/registerScreen': (context) => const RegisterScreen(),
        '/loginScreen': (context) => const LoginScreen(),
        '/dashboardScreen': (context) => const DashboardScreem(),
        '/testScreen': (context) => const TestScreen(),
        '/searchScreen': (context) => const SearchScreen(),
        '/aboutScreen': (context) => const AboutScreen(),
        '/vehicleScreen': (context) => const VehicleScreen(),
        '/articleScreen': (context) => const ArticleScreen(),
        '/profileScreen': (context) => const ProfileScreen(),
        '/bookingScreen': (context) => const BookingScreen(),
        '/articleDetailsScreen': (context) => const ArticleDetailsScreen(),
      },
    ),
  );
}
