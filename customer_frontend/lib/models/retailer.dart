import 'package:equatable/equatable.dart';

class Retailer extends Equatable {
  double? RetailerID;
  String? RetailerName;

  Retailer({
    this.RetailerID,
    this.RetailerName
  });

  @override
  List<Object?> get props => [RetailerID];
}