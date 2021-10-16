class FormValidator {
  static dynamic required({
    required String value,
    required String title,
  }) {
    if (value.isEmpty) {
      return "$title is Required";
    }
    return null;
  }

  static dynamic validateName({
    required String value,
    required String title,
  }) {
    // required(title: title, value: value);
    if (value.isEmpty) {
      return "$title is Required";
    }
    RegExp regExp = new RegExp("^[a-zA-Z\s-]+\$");
    if (!regExp.hasMatch(value)) {
      return "$title is Required";
    }
    return null;
  }

  static dynamic validateFullName({
    required String value,
    required String title,
  }) {
    // required(title: title, value: value);
    if (value.isEmpty) {
      return "$title is Required";
    }
    int splitedValue = value.split(" ").length;
    if (splitedValue < 2) {
      return "Enter a valid $title";
    }
    return null;
  }

  static dynamic validateEmail({
    required String value,
    required String title,
  }) {
    // required(title: title, value: value);
    if (value.isEmpty) {
      return "$title is Required";
    }
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);
    if (!regExp.hasMatch(value)) {
      return "Enter a valid Email Address";
    }
    return null;
  }

  static dynamic validateMobile({
    required String value,
    required String title,
  }) {
    return required(title: title, value: value);
  }

  static dynamic compareTwoString({
    required String value1,
    required String value2,
    required String title,
  }) {
    if (value1 != value2) {
      return "$title must be equal";
    }
    return null;
  }

  static dynamic validatePassword({
    required String value,
    required String title,
  }) {
    if (value.isEmpty) {
      return "$title is required";
    }
    // Use any password length of your choice here
    if (value.length < 5) {
      return "$title must be greater than 5 character";
    }

    return null;
  }

  static bool validateCollege({
    required dynamic value,
  }) {
    if (value is String) {
      return false;
    }
    return true;
  }
}
