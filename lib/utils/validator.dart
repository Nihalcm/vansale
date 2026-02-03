class Validators {
  static String? validateEmpty(String? value, {bool optional = false}) {
    if (optional) return null;
    if (value == null || value.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String? validateEmail(String? value, {bool optional = false}) {
    if (optional && (value == null || value.isEmpty)) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Email cannot be empty';
    }
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value, {bool optional = false}) {
    if (optional && (value == null || value.isEmpty)) return null;
    if (value == null || value.trim().isEmpty) {
      return 'Mobile no cannot be empty';
    }
    final phoneRegex = RegExp(r'^[0-9]{9}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Enter a valid 9-digit mobile number';
    }
    return null;
  }

  static String? validatePassword(String? value, {bool optional = false}) {
    if (optional && (value == null || value.isEmpty)) return null;
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
