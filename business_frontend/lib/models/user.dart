import 'package:business_frontend/shared/json_serializable.dart';

class User implements JsonSerializable {
  int? _userId;
  String? _name;
  String? _firebaseUserId;
  String? _email;
  bool? _canClaimCoupon;
  bool? _canEditDiscount;
  bool? _canEditBusinessUser;
  bool? _canEditBusinessInfo;
  bool? _canEditAdmin;

  User();

  static User toClass(Map<String, dynamic> json) {
    User user = User();

    user._userId = json['userId'];
    user._name = json['name'];
    user._firebaseUserId = json['firebaseUserId'];
    user._email = json['email'];
    user._canClaimCoupon = json['canClaimCoupon'];
    user._canEditDiscount = json['canEditDiscount'];
    user._canEditBusinessInfo = json['canEditBusinessInfo'];
    user._canEditBusinessUser = json['canEditBusinessUser'];
    user._canEditAdmin = json['canEditAdmin'];

    return user;
  }

  @override
  String toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }

  bool? get canEditAdmin => _canEditAdmin;

  set canEditAdmin(bool? value) {
    _canEditAdmin = value;
  }

  bool? get canEditBusinessInfo => _canEditBusinessInfo;

  set canEditBusinessInfo(bool? value) {
    _canEditBusinessInfo = value;
  }

  bool? get canEditBusinessUser => _canEditBusinessUser;

  set canEditBusinessUser(bool? value) {
    _canEditBusinessUser = value;
  }

  bool? get canEditDiscount => _canEditDiscount;

  set canEditDiscount(bool? value) {
    _canEditDiscount = value;
  }

  bool? get canClaimCoupon => _canClaimCoupon;

  set canClaimCoupon(bool? value) {
    _canClaimCoupon = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get firebaseUserId => _firebaseUserId;

  set firebaseUserId(String? value) {
    _firebaseUserId = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  int? get userId => _userId;

  set userId(int? value) {
    _userId = value;
  }
}
