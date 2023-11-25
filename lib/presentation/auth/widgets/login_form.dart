import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/ui/ui_constants.dart';
import '../../../utils/app_utils.dart';
import '../../shared_widgets/btn_wiget.dart';
import '../../shared_widgets/text_field.dart';
import '../../shared_widgets/text_widget.dart';
import '../login_cubit/login_cubit.dart';
import '../register_screen/verify_phone.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'intro_login'.tr,
            fontSize: 20.sp,
          ),
          SizedBox(
            height: 40.h,
          ),
          BoxInputField(
            errorMessage: 'Enter_phone',
            controller: phoneController,
            placeholder: 'phone'.tr,
          ),
          SizedBox(
            height: 24.h,
          ),
          BoxInputField(
            errorMessage: 'Enter_password',
            password: true,
            controller: passwordController,
            placeholder: 'password'.tr,
          ),
          SizedBox(
            height: 30.h,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, authState) {
              if (authState is LoginStateFailed) {
                AppUtils.showToast(
                    msg:"المستخدم غير موجود" , bgColor: errorColor);
              }
              if (authState is LoginStateLoaded) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeScreen()));

              }
            },
            builder: (context, state) {
              return state is LoginStateLoading
                  ? spinKit
                  : BtnWidget(
                  width: 400.w,
                  height: 50.h,
                  txt: 'login'.tr,
                  fontSize: 20,
                  onClicked: () {
                    if (_formKey.currentState!.validate()) {

                      if(phoneController.text.length==11){
                        context.read<LoginCubit>().signInWithPhoneNumber(
                            phoneController.text
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const VerifyPhoneNumber(isLogin: true,)));

                      }else{
                        context.read<LoginCubit>().signIn(
                            phoneController.text,
                            passwordController.text
                        );
                      }

                    }
                  },
                  colorTxt: white,
                  colorBtn: primaryColor);
            },
          ),

        ],
      ),
    );
  }
}
