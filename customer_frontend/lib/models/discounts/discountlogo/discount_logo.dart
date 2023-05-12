import 'package:equatable/equatable.dart';
import 'package:studio_projects/models/discounts/discountlogo/discountlogotypes/full_width_discount_logo.dart';
import 'package:studio_projects/models/discounts/discountlogo/discountlogotypes/half_width_discount_logo.dart';

class DiscountLogo {
  String imageUrl;

  DiscountLogo({required this.imageUrl});

  factory DiscountLogo.fromJson(Map<String, dynamic> json) {
    switch (json['type']) {
      case 'full':
        {
          return FullWidthDiscountLogo(imageUrl: json['imageUrl']);
        }
        break;
      case 'half':
        {
          return HalfWidthDiscountLogo(imageUrl: json['imageUrl']);
        }
        break;
    }
    
    return DiscountLogo(imageUrl: '');
  }
}
