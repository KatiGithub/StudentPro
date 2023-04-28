import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_event.dart';
import 'package:studio_projects/shared/common_blocs/retailer/retailer_state.dart';

import '../../../models/retailers/retailer.dart';
import '../../../models/retailers/retailer_post.dart';

class RetailerBloc extends Bloc<RetailerEvent, RetailerState> {
  RetailerBloc() : super(RetailerInitial()) {
    on<OnGetRetailerInformation>(
        (event, emit) => _OnGetRetailerInformation(event, emit));
  }

  void _OnGetRetailerInformation(
      OnGetRetailerInformation event, Emitter<RetailerState> emit) {
    double retailerID = event.retailer.RetailerID!;

    // Retrieve RetailerPosts and RetailerDescription

    String retailerDescription =
        "This is the area where the description set by the retailer will be put. These descriptions can be customised and will in the future include features such as hyperlink texts.";

    List<RetailerPost> retailerPosts = [];

    for (int i = 0; i < 20; i++) {
      retailerPosts.add(RetailerPost(
          postTitle: "Test Title",
          postID: i.toDouble(),
          postDescription: "Test Description",
          postMediaLinks: [
            "assets/food_test.jpg",
            "assets/food_test.jpg",
            "assets/food_test.jpg",
            "assets/food_test.jpg"
          ],
          postMadeOn: i + 100));
    }

    emit(RetailerLoadComplete(
        retailer: event.retailer.copyWith(
            retailerDescription: retailerDescription,
            retailerPosts: retailerPosts)));

    emit(RetailerInitial());
  }
}
