import 'package:flutter/material.dart';
import "package:curved_navigation_bar/curved_navigation_bar.dart";

import '../components/customShape.dart';

class DashboardScreem extends StatefulWidget {
  const DashboardScreem({Key? key}) : super(key: key);

  @override
  State<DashboardScreem> createState() => _DashboardScreemState();
}

class _DashboardScreemState extends State<DashboardScreem> {
  int bottomNavIndex = 2;

  Color bgColorCar = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorBike = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorVan = const Color.fromRGBO(243, 243, 243, 1);
  String carIcon = "car-red.png";
  String bikeIcon = "bike-red.png";
  String busIcon = "bus-red.png";
  String vanIcon = "van-red.png";

  _iconClicked(String vehicle) {
    if (vehicle == "car") {
      carIcon = "car-white.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-red.png";
      vanIcon = "van-red.png";
      bgColorCar = Colors.red;
      bgColorBike =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bike") {
      carIcon = "car-red.png";
      bikeIcon = "bike-white.png";
      busIcon = "bus-red.png";
      vanIcon = "van-red.png";
      bgColorBike = Colors.red;
      bgColorCar =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "van") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-red.png";
      vanIcon = "van-white.png";
      bgColorVan = Colors.red;
      bgColorCar =
          bgColorBike = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bus") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-white.png";
      vanIcon = "van-red.png";
      bgColorBus = Colors.red;
      bgColorCar =
          bgColorVan = bgColorVan = const Color.fromRGBO(243, 243, 243, 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(
        Icons.person,
        size: 30,
      ),
      const Icon(
        Icons.search,
        size: 30,
      ),
      const Icon(
        Icons.home,
        size: 30,
      ),
      const Icon(
        Icons.bookmark_added_rounded,
        size: 30,
      ),
      const Icon(
        Icons.settings,
        size: 30,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 130,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.menu,
                      size: 40,
                      color: Colors.white,
                    ),
                    Image.asset(
                      "assets/images/logo-sm.png",
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () => setState(() {
                    _iconClicked("car");
                  }),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgColorCar,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ]),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                      child: Image.asset("assets/images/$carIcon"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    _iconClicked("bike");
                  }),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgColorBike,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ]),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                      child: Image.asset("assets/images/$bikeIcon"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    _iconClicked("van");
                  }),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgColorVan,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ]),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                      child: Image.asset("assets/images/$vanIcon"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => setState(() {
                    _iconClicked("bus");
                  }),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgColorBus,
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 4),
                          )
                        ]),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                    child: Center(
                      child: Image.asset("assets/images/$busIcon"),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            index: bottomNavIndex,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: Colors.red,
            color: const Color.fromARGB(255, 0, 0, 0),
            items: items,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(milliseconds: 500),
            onTap: (index) {
              //Handle button tap
            },
          ),
        ),
      ),
    );
  }
}
