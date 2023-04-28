import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:studio_projects/models/retailers/retailer_post.dart';

@JsonSerializable()
class Retailer extends Equatable {
  double? RetailerID;
  String? RetailerName;
  String? retailerDescription;
  List<RetailerPost>? retailerPosts;

  Retailer({
    this.RetailerID,
    this.RetailerName,
    this.retailerPosts
  });

  factory Retailer.fromJson(Map<String, dynamic> json) => _RetailerFromJson(json);

  Retailer copyWith({String? retailerDescription, List<RetailerPost>? retailerPosts}) {
    Retailer retailer = Retailer(
      RetailerID: this.RetailerID,
      RetailerName: this.RetailerName,
    );

    if(retailerDescription != null) {
      retailer.retailerDescription = retailerDescription;
    }
    if(retailerPosts != null && retailerPosts.length > 0) {
      retailer.retailerPosts = retailerPosts;
    }

    return retailer;
  }

  @override
  List<Object?> get props => [RetailerID];
}

Retailer _RetailerFromJson(Map<String, dynamic> json) {
  return Retailer(
    RetailerID: json['retailerID'],
    RetailerName: json['retailerName']
  );
}