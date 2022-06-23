import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:nrental/model/vehicle.dart';
import 'package:nrental/utils/url.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  State<VehicleScreen> createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final _daysController = TextEditingController();
  final _dateController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  int counter = 1;
  _checkNotificationEnabled() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isaAllowed) {
        if (!isaAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
  }

  _showNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: counter,
        channelKey: 'basic_channel',
        title: "Car Booked",
        body: 'You have successfully booked a tesla',
      ),
    );
    setState(() {
      counter++;
    });
  }

  @override
  void initState() {
    _checkNotificationEnabled();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Vehicle vehicle = ModalRoute.of(context)!.settings.arguments as Vehicle;
    void _bookingForm(context) => showModalBottomSheet<void>(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              decoration: const BoxDecoration(
                // color: Color.fromARGB(255, 242, 238, 238),
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _dateField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _daysField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _phoneField(),
                      const SizedBox(
                        height: 20,
                      ),
                      _addressField(),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          label: const Text(
                            'Confirm Booking',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(Icons.check_circle),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            _showNotification();
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '$baseUrl${vehicle.vehicle_image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 20,
                      top: 20,
                      child: Icon(
                        Icons.bookmark,
                        color: Color.fromARGB(255, 228, 224, 224),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: SizedBox(
                        height: 50,
                        child: ElevatedButton.icon(
                          label: const Text(
                            'Book Now',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(Icons.car_rental_rounded),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            _bookingForm(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${vehicle.vehicle_name}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. ${vehicle.booking_cost} / day',
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.green),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Specifications",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 98, 98, 98),
                      fontWeight: FontWeight.w700,
                    ),
                  )),
              const SizedBox(
                height: 20,
              ),
              Text(
                "${vehicle.vehicle_desc}   Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color.fromARGB(179, 174, 173, 173),
                thickness: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _dateField() => TextFormField(
        controller: _dateController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "Booking Date",
          suffixIcon: const Icon(Icons.calendar_month),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Widget _daysField() => TextFormField(
        controller: _daysController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "No of Days",
          suffixIcon: const Icon(Icons.timer),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Widget _phoneField() => TextFormField(
        controller: _phoneController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "Phone No",
          suffixIcon: const Icon(Icons.call),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
  Widget _addressField() => TextFormField(
        controller: _addressController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "No of Days",
          suffixIcon: const Icon(Icons.location_on),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 234, 98, 7),
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 135, 142, 135),
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
}
