import 'package:geolocator/geolocator.dart';

class LocationUtil {

  static Future<LocationPermission> requestUserPermission() {
    return Geolocator.checkPermission().then((LocationPermission locationPermission) async {
      if(locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always) {
        return locationPermission;
      } else if(locationPermission == LocationPermission.denied){
        return await Geolocator.requestPermission();
      } else {
        return locationPermission;
      }
    });
  }
}
