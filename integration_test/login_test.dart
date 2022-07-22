import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nrental/screen/dashboard_screen.dart';
import 'package:nrental/screen/login_screen.dart';
import 'package:nrental/screen/register_screen.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Login User", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 234, 98, 7),
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/dashboardScreen': (context) => const DashboardScreen(),
        // '/registerScreen': (context) => const RegisterScreen(),
      },
      home: const LoginScreen(),
    ));
    Finder username = find.byKey(const ValueKey('username'));
    await tester.enterText(username, 'user1234');
    Finder password = find.byKey(const ValueKey('password'));
    await tester.enterText(password, 'user1234');
    Finder signInBtn = find.byKey(const ValueKey('signInBtn'));
    // Finder btnSignUp = find.byKey(const ValueKey('signUpBtn'));
    await tester.tap(signInBtn);
    await tester.pumpAndSettle(const Duration(seconds: 2));
    expect(find.byType(CurvedNavigationBar), findsOneWidget);
  });

  testWidgets("Register User", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 234, 98, 7),
        primarySwatch: Colors.red,
        fontFamily: 'Poppins',
      ),
      routes: {
        '/loginScreen': (context) => const LoginScreen(),
      },
      home: const RegisterScreen(),
    ));
    Finder username = find.byKey(const ValueKey('username'));
    await tester.enterText(username, 'user544444');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    Finder password = find.byKey(const ValueKey('password'));
    await tester.enterText(password, 'user544444');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'user543@gmail.com');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    Finder phone = find.byKey(const ValueKey('phone'));
    await tester.enterText(phone, '23423423');
    await tester.pumpAndSettle(const Duration(seconds: 1));
    Finder signUpBtn = find.byKey(const ValueKey('signUpBtn'));
    await tester.tap(signUpBtn);
    await tester.pumpAndSettle();
    expect(find.text('Register success'), findsOneWidget);
  });
}
