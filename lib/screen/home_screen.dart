import 'package:flutter/material.dart';
import 'package:nrental/model/brand.dart';

import '../model/vehicle2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      bgColorCar = const Color.fromRGBO(255, 114, 94, 1);
      bgColorBike =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bike") {
      carIcon = "car-red.png";
      bikeIcon = "bike-white.png";
      busIcon = "bus-red.png";
      vanIcon = "van-red.png";
      bgColorBike = const Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorVan = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "van") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-red.png";
      vanIcon = "van-white.png";
      bgColorVan = const Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorBike = bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
    }
    if (vehicle == "bus") {
      carIcon = "car-red.png";
      bikeIcon = "bike-red.png";
      busIcon = "bus-white.png";
      vanIcon = "van-red.png";
      bgColorBus = const Color.fromRGBO(255, 114, 94, 1);
      bgColorCar =
          bgColorVan = bgColorBike = const Color.fromRGBO(243, 243, 243, 1);
    }
  }

  List<Vehicle> lstVehicle = [
    Vehicle(
      name: "Yamaha r1",
      image:
          "https://i.pinimg.com/originals/64/a5/92/64a5923a87f1a724a0b2f5ea1535dcab.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Tesla Model S",
      image: "https://www.picng.com/upload/tesla_car/png_tesla_car_23349.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Toyota Hiace",
      image:
          "https://www.seekpng.com/png/full/430-4304003_hiace-super-long-wheelbase-commuter-bus-french-vanilla.png",
      cost: "9000",
    ),
    Vehicle(
      name: "CBR sport",
      image:
          "https://www.freepnglogos.com/uploads/bike-png/honda-cbr-sport-bike-png-image-pngpix-22.png",
      cost: "9000",
    ),
    Vehicle(
      name: "Tour Bus",
      image: "https://www.freeiconspng.com/thumbs/bus-png/bus-png-4.png",
      cost: "9000",
    )
  ];

  List<Brand> lstBrand = [
    Brand(
        image:
            "https://i0.wp.com/zeevector.com/wp-content/uploads/2021/02/TVS-Logo-PNG.png?fit=1088%2C255&ssl=1"),
    Brand(
      image:
          "https://e7.pngegg.com/pngimages/773/525/png-clipart-yamaha-motor-company-yamaha-corporation-motorcycle-logo-pixels-kingdom-gmbh-motorcycle-text-trademark.png",
    ),
    Brand(
      image:
          "https://logos-world.net/wp-content/uploads/2021/03/Hyundai-Logo-2011-2017.png",
    ),
    Brand(
      image:
          "https://cdn.freebiesupply.com/logos/large/2x/honda-7-logo-png-transparent.png",
    ),
    Brand(
      image:
          "https://www.freepnglogos.com/uploads/toyota-logo-png/toyota-logos-brands-logotypes-0.png",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 233, 214, 1),
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Image.network(
                      "https://www.picng.com/upload/tesla_car/png_tesla_car_23349.png",
                      height: 130,
                    ),
                    Column(
                      children: [
                        const Text(
                          "Rent a Tesla",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "30% OFF",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromRGBO(255, 114, 94, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () => {},
                          child: const Text(
                            "Book now",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: lstBrand.length,
                separatorBuilder: (context, _) => SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                itemBuilder: (context, index) => brandCard(lstBrand[index]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                children: const [
                  Text(
                    "Explore",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w900),
                  ),
                  Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                mainAxisExtent: 260,
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
            const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.bookmark,
                color: Colors.grey,
              ),
            ),
            Image.network(
              "${lstVehicle[index].image}",
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

  Widget brandCard(brand) => SizedBox(
        width: 60,
        child: Image.network(
          brand.image!,
          fit: BoxFit.contain,
        ),
      );
}
