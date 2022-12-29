import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high,
              forceAndroidLocationManager: true)
          .timeout(const Duration(seconds: 15));

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (error) {
      print('Something goes wrong: $error');
    }
  }
}
