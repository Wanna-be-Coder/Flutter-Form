class ValidationMixins {
  String? validateEmail(dynamic value) {
    if (!value.contains("@")) {
      return "Email not valid";
    }
  }

  String? validatorPassword(dynamic value) {
    if (value.length < 8) {
      return "Password not valid";
    }
  }
}
