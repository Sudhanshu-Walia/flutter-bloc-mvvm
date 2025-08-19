import 'helper.dart';

class Validator {
  static final Validator _singleton = Validator._internal();

  factory Validator() {
    return _singleton;
  }

  Validator._internal();

  static Validator get instance => _singleton;

  var error = "";




  bool loginValidator({
    required String email,
    required String password,
  }) {
    if (email.isEmpty) {
      error = "Email cannot be empty";
      return false;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.trim())) {
      error = "Invalid email format";
      return false;
    }

    if (password.isEmpty) {
      error = "Password cannot be empty";
      return false;
    }

    return true;
  }
}
