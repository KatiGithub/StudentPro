import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/views/main/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit():
        super(HomeInitial()) {
    getDiscounts();
  }

  void getDiscounts() {
    for(int i = 0; i < 12; i++) {
      state.discounts.add(new CodeDiscount(
        discountImage: 'assets/food_test.jpg',
        discountDescription: "Test Description",
        discountTitle: 'Promotion'
      ));
    }
  }
}