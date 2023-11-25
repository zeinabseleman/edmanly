import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/auth/widgets/social_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/ui/ui_constants.dart';
import '../../../generated/assets.dart';
import '../../../utils/app_utils.dart';
import '../../home/home_screen.dart';
import '../../shared_widgets/text_widget.dart';
import '../login_cubit/login_cubit.dart';

class SocialWithSocial extends StatelessWidget {
  const SocialWithSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          "register_using_social".tr,
        ),
        SizedBox(
          height: 30.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, authState) {
                if (authState is FacebookLoginFailed) {
                  AppUtils.showToast(
                      msg:"المستخدم غير موجود" , bgColor: errorColor);
                }
                if (authState is FacebookLoginLoaded) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeScreen()));

                }
              },
              builder: (context, state) {
                return state is FacebookLoginLoading
                    ? spinKit
                    :  SocialButton(
                  title: 'facebook',
                  icon: Assets.facebook,
                  onClicked: (){
                    context.read<LoginCubit>().signInWithFacebook();
                  },
                );

              },
            ),
            BlocConsumer<LoginCubit, LoginState>(
              listener: (context, authState) {
                if (authState is GoogleLoginFailed) {
                  AppUtils.showToast(
                      msg:"المستخدم غير موجود" , bgColor: errorColor);
                }
                if (authState is GoogleLoginLoaded) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const HomeScreen()));

                }
              },
              builder: (context, state) {
                return state is GoogleLoginLoading
                    ? spinKit
                    :  SocialButton(
                  title: 'google',
                  icon: Assets.google,
                  onClicked: (){
                    context.read<LoginCubit>().signInWithGoogle();
                  },
                );

              },
            ),

          ]
        ),
      ],
    );
  }
}
