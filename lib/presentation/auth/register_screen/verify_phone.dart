import 'dart:io';

import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/model/user_model.dart';
import 'package:edmanly/presentation/shared_widgets/screen_main_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/assets.dart';
import '../../shared_widgets/text_widget.dart';
import '../widgets/verify_code_form.dart';

class VerifyPhoneNumber extends StatelessWidget {
final UserModel? userModel;
final bool isLogin;
final List<File>? images;

  const VerifyPhoneNumber({super.key,  this.userModel,  this.images,required this.isLogin});
  @override
  Widget build(BuildContext context) {
    return ScreenMainWidget(
      title: '',
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 50.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                  Assets.logo,
                  width: 150
              ),
              TextWidget(
                'verify_phone'.tr,
                fontSize: 16.sp,
              ),
              SizedBox(
                height: 7.h,
              ),
              TextWidget(
                'enter_code'.tr,
                fontSize: 16.sp,
              ),
              SizedBox(
                height: 34.h,
              ),
              VerifyCodeForm(
                userModel: userModel,
                images: images,
                isLogin: isLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
