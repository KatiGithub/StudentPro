import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RetailerPost extends Equatable {
  double postID;
  String postTitle;
  String postDescription;
  List<String> postMediaLinks;
  double postMadeOn;

  RetailerPost(
      {
        required this.postID,
        required this.postTitle,
        required this.postDescription,
        required this.postMediaLinks,
        required this.postMadeOn
      });

  factory RetailerPost.fromJson(Map<String, dynamic> json) => _RetailerPostFromJson(json);

  @override
  List<Object?> get props => [];
}

RetailerPost _RetailerPostFromJson(Map<String, dynamic> json) {
  return RetailerPost(
      postID: json['postID'],
      postTitle: json['postTitle'],
      postDescription: json['Description'],
      postMediaLinks: json['postMediaLinks'],
      postMadeOn: json['postMadeOn'] as double);
}
