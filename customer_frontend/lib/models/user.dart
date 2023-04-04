import 'package:studio_projects/models/university.dart';
import 'package:studio_projects/models/usercredentials.dart';

class User {
  String? userId;
  String? firstName;
  String? lastName;
  String? personalEmail;
  String? phoneNumber;
  double? dateOfBirth;
  University? university;
  UserCredentials userCredentials = UserCredentials();

  User(
      {this.userId = '',
      this.firstName = '',
      this.lastName = '',
      this.personalEmail = '',
      this.phoneNumber = '',
      this.dateOfBirth = 0});

  bool isFilledOut() {
    if (this.userId != '' &&
        this.firstName != '' &&
        this.lastName != '' &&
        this.personalEmail != '' &&
        this.dateOfBirth != 0 &&
        this.university != null &&
        this.userCredentials.isFilledOut()) {
      return true;
    }
    return false;
  }

  @override
  copyWith({
   String? userId,
   String? firstName,
   String? lastName,
   String? personalEmail,
   double? dateOfBirth,
   University? university,
   String? schoolEmail,
   String? password
  }) {
    User user = User(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      personalEmail: personalEmail ?? this.personalEmail,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );

    user.userCredentials.schoolEmail = schoolEmail ?? this.userCredentials.schoolEmail;
    user.userCredentials.password = schoolEmail ?? this.userCredentials.password;

    user.university = university ?? this.university;

    return user;
  }
}
