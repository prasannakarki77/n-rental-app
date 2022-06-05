import 'package:flutter/material.dart';
import 'package:nrental/components/category_widget.dart';
import 'package:nrental/components/search_widget.dart';
import 'package:nrental/models/vehicle.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';
  late List<Vehicle> vehicles;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    vehicles = allVehicles;
  }

  Color bgColorCar = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorBike = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorBus = const Color.fromRGBO(243, 243, 243, 1);
  Color bgColorVan = const Color.fromRGBO(243, 243, 243, 1);
  String carIcon = "car-red.png";
  String bikeIcon = "bike-red.png";
  String busIcon = "bus-red.png";
  String vanIcon = "van-red.png";

  final allVehicles = <Vehicle>[
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBox(),
        const CategoryWidget(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              mainAxisExtent: 250,
              crossAxisSpacing: 20,
            ),
            padding: const EdgeInsets.all(8),
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final vehicle = vehicles[index];
              return vehicleCard(vehicle);
            },
          ),
        ),
      ],
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

  Widget vehicleCard(vehicle) {
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
              "${vehicle.image}",
              height: 90,
              fit: BoxFit.contain,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${vehicle.name}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Rs ${vehicle.cost}/day",
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

  Widget searchBox() => SearchWidget(
        text: query,
        hintText: 'Search  Vehicles',
        onChanged: searchVehicle,
      );
  void searchVehicle(String query) {
    final vehicles = allVehicles.where((vehicle) {
      final vehicleName = vehicle.name?.toLowerCase();
      final searchText = query.toLowerCase();
      return vehicleName!.contains(searchText);
    }).toList();

    setState(() {
      this.query = query;
      this.vehicles = vehicles;
    });
  }
}
