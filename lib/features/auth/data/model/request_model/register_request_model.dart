class RegisterRequestModel {
  String? name;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
  String? countryCode;

  RegisterRequestModel({
    this.phone,
    this.password,
    this.email,
    this.name,
    this.passwordConfirmation,
    this.countryCode,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_code'] = countryCode;
    map['phone_number'] = phone;
    map['password'] = password;
    map['password_confirmation'] = passwordConfirmation;
    map['email'] = email;
    map['name'] = name;
    return map;
  }
}
