class ValidationMixins {
  String? validateEmail(String value) {
    if (!value.contains("@")) {
      return "Email not valid";
    }
  }

  String? validatorPassword(String value) {
    if (value.length < 8) {
      return "Password not valid";
    }
  }
}
