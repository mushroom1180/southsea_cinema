import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  test('UserSettings has correct default values', () {
    const UserSettings settings = UserSettings();

    expect(settings.name, isEmpty);
    expect(settings.address, isEmpty);
    expect(settings.email, isEmpty);
    expect(settings.receiveNewsletter, isFalse);
  });

  test('UserSettings stores configured values', () {
    const UserSettings settings = UserSettings(
      name: 'Test User',
      address: '1 Test Street',
      email: 'test@example.com',
      receiveNewsletter: true,
    );

    expect(settings.name, 'Test User');
    expect(settings.address, '1 Test Street');
    expect(settings.email, 'test@example.com');
    expect(settings.receiveNewsletter, isTrue);
  });
}
