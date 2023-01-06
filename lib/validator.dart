class Validator {
  static String? validateUsername(String? username) {
    if (username!.isEmpty) {
      return "Username cannot be empty.";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return "Password cannot be empty.";
    } else if (password.length < 6) {
      return "Password must be at least 6 digits long.";
    }
    return null;
  }
}
