import 'dart:io';
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import '../../../generated/assets.dart';
import '../../shared_widgets/text_widget.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
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
                TextWidget(
                  'create_new_pass'.tr,
                  fontSize: 20.sp,
                ),
               // const ForgetPasswordForm(),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
