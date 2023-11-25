import 'dart:convert';


import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefs {
  static SharedPreferences? sharedPrefs;

  Future<void> init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  setName(String value) {
    sharedPrefs!.setString(name, value);
  }
  setGovernorate(String value) {
    sharedPrefs!.setString(govern, value);
  }
  setCity(String value) {
    sharedPrefs!.setString(city, value);
  }
  setAccountTye(String value) {
    sharedPrefs!.setString(accountTye, value);
  }
  setPhone(String value) {
    sharedPrefs!.setString(phone, value);
  }


  setUserSignupCode(String value) {
    sharedPrefs!.setString(signupCode, value);
  }

  String getSignupCode() {
    return sharedPrefs!.getString(signupCode) ?? '';
  }

  void clear() {
    sharedPrefs!.clear();
  }
  String getName() {
    return sharedPrefs!.getString(name) ?? '';
  }
  String getGovernorate() {
    return sharedPrefs!.getString(govern) ?? '';
  }

  String getCity() {
    return sharedPrefs!.getString(city) ?? '';
  }
  String getAccountTye() {
    return sharedPrefs!.getString(accountTye) ?? '';
  }

  String getPhone() {
    return sharedPrefs!.getString(phone) ?? '';
  }


  String getLanguage() {
    return sharedPrefs!.getString(languageCode) ?? 'ar';
  }

  setLanguage(String value) {
    sharedPrefs!.setString(languageCode, value);
  }
}

///// Object
final sharedPrefs = SharedPrefs();
///// Keys
const String languageCode = 'languageCode';
const String signupCode = 'signupCode';
const String loginResponse = 'loginResponse';
const String name = 'name';
const String govern= 'govern';
const String city = 'city';
const String phone = 'phone';
const String accountTye = 'accountTye';
