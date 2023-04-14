import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/views/main/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit():
        super(HomeInitial()) {
    getDiscounts();
  }

  void getDiscounts() {
    for(int i = 0; i < 6; i++) {
      state.discounts.add(new CodeDiscount(
        discountID: i.toDouble(),
        discountImage: 'assets/food_test.jpg',
        discountDescription: "Test Description",
        discountTitle: 'Promotion',
        couponCode: "XXXX-XXXXX-XXXX"
      ));
    }

    for(int i = 0; i < 6; i++) {
      state.discounts.add(new LinkDiscount(
        discountID: i+6.toDouble(),
          discountImage: 'assets/food_test.jpg',
          discountDescription: "Test Description",
          discountTitle: 'Promotion',
        linkRedirect: "https://lin.ee/eHlcWLN"
      ));
    }
  }
}