import 'package:flutter/material.dart';
import 'package:nrental/model/booking_vehicle.dart';
import 'package:nrental/repository/booking_repository.dart';
import 'package:nrental/utils/show_message.dart';
import 'package:nrental/utils/url.dart';

import '../model/booking.dart';

class BookingDetailScreen extends StatefulWidget {
  const BookingDetailScreen({Key? key}) : super(key: key);

  @override
  State<BookingDetailScreen> createState() => _BookingDetailScreenState();
}

class _BookingDetailScreenState extends State<BookingDetailScreen> {
  final _daysController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  DateTime pickedDate = DateTime.now();
  TimeOfDay time = TimeOfDay.now();

  final _timeController = TextEditingController();
  final _dateController = TextEditingController();

  _dateSelected() {
    _dateController.text =
        "${pickedDate.year} - ${pickedDate.month} - ${pickedDate.day}";
  }

  _timeSelected() {
    _timeController.text = "${time.hour}: ${time.minute}";
  }

  _deleteBooking(bookingId) async {
    bool isDeleted = await BookingRepository().deleteBooking(bookingId);
    if (isDeleted) {
      setState(() {
        Navigator.pushNamed(context, '/dashboardScreen');
      });
      _displayMessage(true);
    } else {
      Navigator.pop(context, 'ok');
      _displayMessage(false);
    }
  }

  _displayMessage(bool isDeleted) {
    if (isDeleted) {
      displaySuccessMessage(context, "Booking canceled");
    } else {
      displayErrorMessage(context, "Booking Cancellation Failed");
    }
  }

  _setTextFieldValues(booking) {
    _daysController.text = booking.no_of_days.toString();
    _dateController.text = booking.booking_date ?? "";
    _addressController.text = booking.address ?? "";
    _phoneController.text = booking.contact_no ?? "";
    _timeController.text = booking.booking_time ?? "";
  }

//  _updateBooking(Booking booking) async {
//     bool isUpdated = await UserRepository().updateProfile(user);
//     if (isUpdated) {
//       _displayMessage(true);
//     } else {
//       _displayMessage(false);
//     }
//   }

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
                            _setTextFieldValues(booking);
                            _bookingForm(context);
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
                            _showMyDialog(booking.id);
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

  Widget _dateField() => TextFormField(
        readOnly: true,
        controller: _dateController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "Booking Date",
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_month),
            onPressed: () {
              _pickDate();
            },
          ),
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
  Widget _timeField() => TextFormField(
        readOnly: true,
        controller: _timeController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "Booking Time",
          suffixIcon: IconButton(
            icon: const Icon(Icons.timer),
            onPressed: () {
              _pickTime();
            },
          ),
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
        keyboardType: TextInputType.number,
        controller: _daysController,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          labelText: "No of Days",
          suffixIcon: const Icon(Icons.sunny),
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
        keyboardType: TextInputType.number,
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
          labelText: "Address",
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

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
        _dateSelected();
      });
    }
  }

  _pickTime() async {
    TimeOfDay? t = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (t != null) {
      setState(() {
        time = t;
        _timeSelected();
      });
    }
  }

  void _bookingForm(context) => showModalBottomSheet<void>(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.65,
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
                    _timeField(),
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
                          'Update Booking',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                        icon: const Icon(Icons.edit_note_rounded),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10), // <-- Radius
                          ),
                        ),
                        onPressed: () {
                          Booking booking = Booking(
                            no_of_days: _daysController.text,
                            booking_date: _dateController.text,
                            booking_time: _timeController.text,
                            address: _addressController.text,
                            contact_no: _phoneController.text,
                          );

                          // _bookVehicle(
                          //     booking, vehicle.id, vehicle.vehicle_name);

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

  Future<Future<String?>> _showMyDialog(bookingId) async {
    return showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: const Text('Cancel Booking'),
              content:
                  const Text('Are you sure you want to cancel this booking?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    _deleteBooking(bookingId);
                  },
                  child: const Text('Yes'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, 'No'),
                  child: const Text('No'),
                ),
              ],
            ));
  }
}
