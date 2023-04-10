class ValidationMixins {
  String? validateEmail(value) {
    if (!value.contains("@")) {
      return "Email not valid";
    }
  }

  String? validatorPassword(value) {
    if (value.length < 8) {
      return "Password not valid";
    }
  }
}
