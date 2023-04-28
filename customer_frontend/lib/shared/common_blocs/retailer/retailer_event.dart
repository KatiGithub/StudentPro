import 'package:equatable/equatable.dart';

import '../../../models/retailers/retailer.dart';

abstract class RetailerEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class OnGetRetailerInformation extends RetailerEvent {
  Retailer retailer;

  OnGetRetailerInformation({required this.retailer});

  @override
  List<Object> get props => [retailer];
}