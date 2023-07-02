import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_event.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_state.dart';

import '../../../models/retailers/business.dart';
import '../../../models/retailers/business_post.dart';

class RetailerBloc extends Bloc<RetailerEvent, RetailerState> {
  RetailerBloc() : super(RetailerInitial()) {
    on<OnGetRetailerInformation>(
        (event, emit) => _OnGetRetailerInformation(event, emit));
  }

  void _OnGetRetailerInformation(
      OnGetRetailerInformation event, Emitter<RetailerState> emit) {
    int retailerID = event.retailer.businessId;

    // Retrieve RetailerPosts and RetailerDescription

    String retailerDescription =
        "This is the area where the description set by the retailer will be put. These descriptions can be customised and will in the future include features such as hyperlink texts.";

    List<BusinessPost> retailerPosts = [];

    emit(RetailerLoadComplete(
        retailer: event.retailer));

    emit(RetailerInitial());
  }
}
