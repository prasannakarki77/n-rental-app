import 'package:nrental/api/review_api.dart';
import 'package:nrental/model/review.dart';

class ReviewRepository {
  Future<bool> addReview(Review review, vehicleId) async {
    return ReviewApi().addReview(review, vehicleId);
  }
  // Future<BookingDetailsResponse?> getBookingDetails(bookingId) async {
  //   return BookingAPI().getBookingDetails(bookingId);
  // }

}
