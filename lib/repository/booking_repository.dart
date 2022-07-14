import 'package:nrental/api/booking_api.dart';
import 'package:nrental/model/booking.dart';

class BookingRepository {
  Future<bool> addBooking(Booking booking, vehicleId) async {
    return BookingAPI().addBooking(booking, vehicleId);
  }

  // Future<ProductResponse?> getProducts() async {
  //   return ProductAPI().getProducts();
  // }
}
