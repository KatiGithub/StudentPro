import 'package:studio_projects/models/branch.dart';
import 'package:studio_projects/models/discounts/discount.dart';

class Transaction {
  int _transactionId;
  Discount _discount;
  String? _couponCode;
  double? _usedOn;
  Branch? _branch;
  String _status;

  Transaction.name(this._transactionId, this._discount, this._couponCode, this._usedOn, this._branch, this._status);

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  Branch? get branch => _branch;

  set branch(Branch? value) {
    _branch = value;
  }

  double? get usedOn => _usedOn;

  set usedOn(double? value) {
    _usedOn = value;
  }

  String? get couponCode => _couponCode;

  set couponCode(String? value) {
    _couponCode = value;
  }

  Discount get discount => _discount;

  set discount(Discount value) {
    _discount = value;
  }

  int get transactionId => _transactionId;

  set transactionId(int value) {
    _transactionId = value;
  }

  static Transaction toClass(Map<String, dynamic> json) {
    return Transaction.name(
        json['id'],
        Discount.toClass(json['discount']),
        json['discountCouponCode'],
        json['usedOn'],
        json['branch'] != null ? Branch.toClass(json['branch']) : null,
        json['status']
    );
  }
}