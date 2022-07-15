import 'package:flutter/material.dart';
import 'package:nrental/model/booking_vehicle.dart';
import 'package:nrental/utils/url.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  @override
  Widget build(BuildContext context) {
    BookingVehicle booking =
        ModalRoute.of(context)!.settings.arguments as BookingVehicle;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
      ),
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
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          '$baseUrl${booking.vehicle_id?.vehicle_image}',
                          fit: BoxFit.contain,
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
                      left: 10,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          label: const Text(
                            'Update details',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(
                            Icons.edit_note_outlined,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            // _bookingForm(context);
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton.icon(
                          label: const Text(
                            'Cancel booking',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          icon: const Icon(
                            Icons.cancel_outlined,
                            size: 20,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // <-- Radius
                            ),
                          ),
                          onPressed: () {
                            // _bookingForm(context);
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
                    '${booking.vehicle_id!.vehicle_name}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rs. ${booking.vehicle_id!.booking_cost} / day',
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
                "${booking.vehicle_id!.vehicle_desc}   Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: const TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'No of Days: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 124, 123, 123),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${booking.no_of_days}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Date and Time: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 124, 123, 123),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${booking.booking_date}, ${booking.booking_time}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Contact No: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 124, 123, 123),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${booking.contact_no}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Address: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 124, 123, 123),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${booking.address}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Status: ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Color.fromARGB(255, 124, 123, 123),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${booking.status}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color.fromARGB(179, 174, 173, 173),
                thickness: 3,
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  height: 40,
                  child: ElevatedButton.icon(
                    label: const Text(
                      'Add Review',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    icon: const Icon(
                      Icons.reviews,
                      size: 20,
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 142, 140, 167),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // <-- Radius
                      ),
                    ),
                    onPressed: () {
                      // _bookingForm(context);
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
