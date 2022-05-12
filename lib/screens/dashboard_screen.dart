import 'package:flutter/material.dart';

import '../components/customShape.dart';

class DashboardScreem extends StatefulWidget {
  const DashboardScreem({Key? key}) : super(key: key);

  @override
  State<DashboardScreem> createState() => _DashboardScreemState();
}

class _DashboardScreemState extends State<DashboardScreem> {
  String carIcon = "car-red.png";
  String bikeIcon = "bike-red.png";
  String busIcon = "bus-red.png";
  String vanIcon = "van-red.png";
  Color bgcolor = const Color.fromRGBO(243, 243, 243, 1);
  _iconClicked() {
    setState(() {
      carIcon = "car-white.png";
      bgcolor = Colors.red;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  onTap: () => _iconClicked(),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgcolor,
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
                  onTap: () => _iconClicked(),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgcolor,
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
                  onTap: () => _iconClicked(),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgcolor,
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
                  onTap: () => _iconClicked(),
                  child: AnimatedContainer(
                    height: 70,
                    width: 80,
                    decoration: BoxDecoration(
                        color: bgcolor,
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
      ),
    );
  }
}
