import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationUtil {

  static Future<LocationPermission> requestUserPermission() {
    return Geolocator.checkPermission().then((LocationPermission locationPermission) {
      if(locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always) {
        return locationPermission;
      } else if(locationPermission == LocationPermission.denied) {
        if(kDebugMode && defaultTargetPlatform == TargetPlatform.iOS) {
          return locationPermission;
        }
        return Geolocator.requestPermission();
      } else {
        return locationPermission;
      }
    });
  }
}
