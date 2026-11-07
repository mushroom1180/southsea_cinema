import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/database/cinema_db.dart';
import 'package:southsea_cinema/models/booking.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUp(() async {
    sqfliteFfiInit();

    final Database database = await databaseFactoryFfiNoIsolate.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: 1,
        onCreate: CinemaDatabase.instance.createTables,
      ),
    );

    CinemaDatabase.instance.setDatabase(database);
  });

  tearDown(() async {
    await CinemaDatabase.instance.close();
  });

  test('Insert, read and number bookings', () async {
    expect(
      await CinemaDatabase.instance.getNextBookingNumber(),
      1001,
    );

    const Booking booking = Booking(
      bookingNumber: 1001,
      summary: '2 x F1 THE MOVIE (2025)',
      total: 15.00,
      date: '18/04/2026 12:45',
    );

    await CinemaDatabase.instance.insertBooking(booking);

    final List<Booking> bookings =
        await CinemaDatabase.instance.getAllBookings();

    expect(bookings.length, 1);
    expect(bookings.first.bookingNumber, 1001);
    expect(bookings.first.summary, '2 x F1 THE MOVIE (2025)');
    expect(bookings.first.total, 15.00);
    expect(bookings.first.date, '18/04/2026 12:45');

    expect(
      await CinemaDatabase.instance.getNextBookingNumber(),
      1002,
    );
  });
}
