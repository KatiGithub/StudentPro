import 'package:equatable/equatable.dart';

class RetailerType extends Equatable {
  String retailerType;
  String retailerDisplayName;

  RetailerType({required this.retailerType, required this.retailerDisplayName});

  @override
  List<Object?> get props => [retailerType];
}
