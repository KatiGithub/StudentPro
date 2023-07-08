import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/service/home_service.dart';
import 'package:studio_projects/shared/service/user_service.dart';
import 'package:studio_projects/shared/utils/location/location_util.dart';
import 'package:studio_projects/views/main/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Business> retailers = [];
  List<Discount> discountsInYourArea = [];
  List<Discount> recommendedDiscount = [];

  final HomeService homeService = HomeService();
  final UserService userService = UserService();

  HomeCubit() : super(HomeInitial());

  void loadHome() async {
    await getRetailer().then((_) async {
      await getDiscountsInYourArea().then((_) async {
        await getRecommendedDiscounts().then((_) {
          emit(HomeLoaded());
        });
      });
    });
  }

  Future<void> getRetailer() {
    return homeService.getRandomRetailers().then((List<Business> businesses) {
      retailers = businesses;
    });
  }

  Future<void> getDiscountsInYourArea() {
    return homeService.getDiscountsLastKnownLocation().then((List<Discount> discounts) {
      discountsInYourArea = discounts;
    });
  }

  Future<void> getRecommendedDiscounts() async {
    return homeService.getRandomDiscounts().then((List<Discount> discounts) {
      recommendedDiscount = discounts;
    });
  }

  Future<void> updateUserLocation() async {
    Geolocator.isLocationServiceEnabled().then((bool isLocationServiceEnabled) {
      if (isLocationServiceEnabled) {
        Geolocator.checkPermission().then((LocationPermission locationPermission) async {
          if (locationPermission == LocationPermission.whileInUse || locationPermission == LocationPermission.always) {
            await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then((Position position) {
              LatLng coordinates = LatLng(position.latitude, position.longitude);
              print(coordinates);
              userService.sendUserLocation(coordinates);
            });
          }
        });
      }
    });
  }
}
