import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_state.dart';
import 'package:studio_projects/shared/service/discount_service.dart';
import 'package:studio_projects/shared/service/home_service.dart';
import 'package:studio_projects/shared/service/retailer_service.dart';

import '../../../models/retailers/business_post.dart';

class RetailerCubit extends Cubit<RetailerState> {

  late Business business;

  List<Discount> discounts = [];
  List<BusinessPost> posts = [];
  List<Business> relatedBusinesses = [];

  final DiscountService discountService = DiscountService();
  final RetailerService retailerService = RetailerService();

  RetailerCubit(): super(RetailerInitial());

  void getDiscountsByBusinessId() {
    emit(RetailerLoading());
    try {
      discountService.getDiscountsByBusinessId(business.businessId).then((List<Discount> discounts) {
        this.discounts = discounts;
        emit(RetailerSuccess());
      });
    } catch(e) {
      emit(RetailerError(e.toString()));
    }
  }
  void addUserClick() async {
    try {
      await retailerService.addBusinessUserClick(business.businessId);
    } catch (e) {
      emit(RetailerError("error"));
    }
  }

   Future<void> getRelatedBusinesses() async {
    HomeService homeService = HomeService();

    try {
      return homeService.getRandomRetailers().then((List<Business> businesses) {
        this.relatedBusinesses = businesses;
      });
    } catch (e) {
      emit(RetailerError(e.toString()));
    }
  }
}
