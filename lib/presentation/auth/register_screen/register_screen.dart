import 'package:edmanly/constants/app_colors.dart';
import 'package:edmanly/presentation/auth/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/have_account_item.dart';
import 'dart:io';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: Platform.isAndroid ? true : false,
      bottom: false,
      child: Scaffold(
        body: SingleChildScrollView(
          child:Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 60.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const RegisterForm(),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                  height: 30.h,
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const HaveAccountItem(
                      title: 'already_have_account',
                      color: textColor,
                    ),
                    HaveAccountItem(
                      title: 'intro_login',
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )

              ],
            ),
          )
        ),
      ),
    );

  }
}
