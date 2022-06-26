import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:wear/wear.dart';

class WearOSDashboardScreen extends StatefulWidget {
  const WearOSDashboardScreen({Key? key}) : super(key: key);

  @override
  State<WearOSDashboardScreen> createState() => _WearOSDashboardScreenState();
}

class _WearOSDashboardScreenState extends State<WearOSDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape shape, Widget? child) {
        return AmbientMode(
          builder: (context, mode, child) {
            return const Scaffold(
              body: Padding(
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text("Dashboard"))),
            );
          },
        );
      },
    );
  }
}
