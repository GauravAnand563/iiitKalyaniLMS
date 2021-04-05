class Validator {
  static String? validateEmail({required String email}) {
    RegExp emailRegExp = RegExp(r"^[A-Za-z0-9._%+-]+@iiitkalyani.ac.in$");

    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter your institute email';
    }

    return null;
  }

  static String? validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }

    return null;
  }
}
