class UserCredentials {
  String? schoolEmail;
  String? password;

  UserCredentials({
    this.schoolEmail = '',
    this.password = '',
  });

  bool isFilledOut() {
    if (this.schoolEmail! != '' && this.password != '') {
      return true;
    }

    return false;
  }
}
