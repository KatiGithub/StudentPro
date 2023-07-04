import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/service/home_service.dart';
import 'package:studio_projects/views/main/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  List<Business> retailers = [];
  List<Discount> discountsInYourArea = [];
  List<Discount> recommendedDiscount = [];

  final HomeService homeService = HomeService();

  HomeCubit() : super(HomeInitial());

  void loadHome() async {
    await getRetailer().then((_) async {
      await getRecommendedDiscounts().then((_) {
        emit(HomeLoaded());
      });
    });
  }

  Future<void> getRetailer() {
    return homeService.getRandomRetailers().then((List<Business> businesses) {
      retailers = businesses;
    });
  }

  void getDiscountsInYourArea() {

  }

  Future<void> getRecommendedDiscounts() async {
    return homeService.getRandomDiscounts().then((List<Discount> discounts) {
      recommendedDiscount = discounts;
    });
  }
}
