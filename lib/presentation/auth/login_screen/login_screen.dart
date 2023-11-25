import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/assets.dart';
import '../widgets/login_form.dart';
import '../widgets/question_item.dart';
import '../widgets/social_register.dart';
import 'dart:io';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid ? true : false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                 Assets.logo,
                  width: 150
                ),
                const LoginForm(),
                SizedBox(
                  height: 30.h,
                ),
                const SocialWithSocial(),
                SizedBox(
                  height: 30.h,
                ),
                const QuestionItem()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
