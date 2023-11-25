

import 'package:edmanly/core/extensions/string_ext.dart';

class TextFieldValidate{

  emailValidation(String? val) {
  if (val!.isEmpty) {
  return 'enter_email'.tr;
  } else if (!RegExp(
  r"^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$")
      .hasMatch(val)) {
  return 'error_email'.tr;
  }
  return null;
  }

  confPasswordValidation(String? val
      ,String passwordController,
      String confPasswordController
      ) {
    if(val!.isEmpty){
      return'register_password_error'.tr;
    }else if(passwordController != confPasswordController){
      return 'conf_password_error'.tr;
    }
    return null;
  }

  notRequiredField(String? val){
    return null;
  }
}