import 'package:flutter/material.dart';
import 'package:nrental/components/category_widget.dart';
import 'package:nrental/model/vehicle.dart';
import 'package:nrental/repository/vehicle_repository.dart';
import 'package:nrental/response/vehicle_response.dart';
import 'package:nrental/utils/url.dart';

import '../components/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // searchBox(),
        const CategoryWidget(),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: FutureBuilder<VehicleResponse?>(
            future: VehicleRepository().getVehicles(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Vehicle> lstVehicles = snapshot.data!.data!;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 30,
                      mainAxisExtent: 260,
                      crossAxisSpacing: 20,
                    ),
                    padding: const EdgeInsets.all(8),
                    itemCount: lstVehicles.length,
                    itemBuilder: (context, index) {
                      final vehicle = lstVehicles[index];
                      return vehicleCard(vehicle);
                    },
                  );
                } else {
                  return const Center(
                    child: Text("No Data"),
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                );
              }
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
            // const Align(
            //   alignment: Alignment.topRight,
            //   child: Icon(
            //     Icons.bookmark,
            //     color: Colors.grey,
            //   ),
            // ),
            // Image.network(
            //   "https://nepalvehiclebooking.com/wp-content/uploads/2020/02/SONATA-hero-option1-764A5360-edit-640x354.jpg",
            //   height: 90,
            //   fit: BoxFit.contain,
            // ),
            Image.network(
              '$baseUrl${vehicle.vehicle_image}',
              height: 100,
              fit: BoxFit.contain,
            ),
            //  baseUrl.contains('10.0.2.2')
            //               ? CircleAvatar(
            //                   backgroundImage: NetworkImage(
            //                     lstProductCategory[index]
            //                         .image!
            //                         .replaceAll('localhost', '10.0.2.2'),
            //                   ),
            //                 )
            //               : CircleAvatar(
            //                   backgroundImage: NetworkImage(
            //                       lstProductCategory[index].image!),
            //                 ),
            const SizedBox(
              height: 20,
            ),
            Text(
              vehicle.vehicle_name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Rs ${vehicle.booking_cost}/day",
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
                onPressed: () => {
                  Navigator.pushNamed(context, '/vehicleScreen',
                      arguments: vehicle)
                },
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
    // final vehicles = lstVehicles.where((vehicle) {
    //   final vehicleName = vehicle.vehicle_name?.toLowerCase();
    //   final searchText = query.toLowerCase();
    //   return vehicleName!.contains(searchText);
    // }).toList();

    // setState(() {
    //   this.query = query;
    //   allVehicles = vehicles;
    // });
  }
}
