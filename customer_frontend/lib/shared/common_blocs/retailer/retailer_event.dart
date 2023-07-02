import 'package:equatable/equatable.dart';

import '../../../models/retailers/business.dart';

abstract class RetailerEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnGetRetailerInformation extends RetailerEvent {
  Business retailer;

  OnGetRetailerInformation({required this.retailer});

  @override
  List<Object> get props => [retailer];
}