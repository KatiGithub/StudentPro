import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discountlogo/discount_logo.dart';
import 'package:studio_projects/models/discounts/discounttypes/codeDiscounts.dart';
import 'package:studio_projects/models/discounts/discounttypes/linkDiscounts.dart';
import 'package:studio_projects/views/main/home/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getDiscounts();
  }

  void getDiscounts() {
    List<String> image_logos = [
      'starbucks_full.png',
      'grab.png',
      'h_and_m.png',
      'kinokuniya.png',
      'nike.png',
      'starbucks.png'
    ];
  }
}
