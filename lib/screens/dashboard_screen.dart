import 'package:flutter/material.dart';
import "package:curved_navigation_bar/curved_navigation_bar.dart";
import 'package:nrental/models/vehicle.dart';

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
      bgColorCar = Color.fromRGBO(255, 114, 94, 1);
      bgColorBike =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bike") {
      carIcon = "car-red.png";
      bikeIcon = "bike-white.png";
      busIcon = "bus-red.png";
      vanIcon = "van-red.png";
      bgColorBike = Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "van") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-red.png";
      vanIcon = "van-white.png";
      bgColorVan = Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorBike = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bus") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-white.png";
      vanIcon = "van-red.png";
      bgColorBus = Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorVan = bgColorBike = const Color.fromRGBO(243, 243, 243, 1);
    }
  }

  List<Vehicle> lstVehicle = [
    Vehicle(
      name: "Rolls Royce",
      image: "rollsRoyce.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Rolls Royce",
      image: "rollsRoyce.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Rolls Royce",
      image: "rollsRoyce.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Rolls Royce",
      image: "rollsRoyce.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Rolls Royce",
      image: "rollsRoyce.png",
      cost: "9000",
    )
  ];

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
        // extendBody: true,
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
              color: const Color.fromRGBO(255, 114, 94, 1),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  vehicleCategory(bgColorCar, carIcon, "car"),
                  vehicleCategory(bgColorBike, bikeIcon, "bike"),
                  vehicleCategory(bgColorVan, vanIcon, "van"),
                  vehicleCategory(bgColorBus, busIcon, "bus")
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 30,
                    mainAxisExtent: 230,
                    crossAxisSpacing: 20,
                  ),
                  padding: const EdgeInsets.all(8),
                  itemCount: lstVehicle.length,
                  itemBuilder: (context, index) {
                    return vehicleCard(index);
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
          child: CurvedNavigationBar(
            index: bottomNavIndex,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: const Color.fromRGBO(255, 114, 94, 1),
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

  Widget vehicleCategory(bgColor, icon, vehicleType) {
    return InkWell(
      onTap: () => setState(() {
        _iconClicked("$vehicleType");
      }),
      child: AnimatedContainer(
        height: 70,
        width: 80,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(9),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            )
          ],
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        child: Center(
          child: Image.asset("assets/images/$icon"),
        ),
      ),
    );
  }

  Widget vehicleCard(index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Image.asset(
              "assets/images/${lstVehicle[index].image}",
              height: 90,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${lstVehicle[index].name}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Rs ${lstVehicle[index].cost}/day",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: Colors.green,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: const Color.fromRGBO(255, 114, 94, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // <-- Radius
                  ),
                ),
                onPressed: () => {},
                child: const Text(
                  "Book",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
