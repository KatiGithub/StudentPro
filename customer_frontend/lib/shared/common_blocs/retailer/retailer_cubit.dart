import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/models/discounts/discount.dart';
import 'package:studio_projects/models/retailers/business.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_state.dart';
import 'package:studio_projects/shared/service/discount_service.dart';

import '../../../models/retailers/business_post.dart';

class RetailerCubit extends Cubit<RetailerState> {

  late Business business;

  List<Discount> discounts = [];
  List<BusinessPost> posts = [];

  final DiscountService discountService = DiscountService();

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
}
