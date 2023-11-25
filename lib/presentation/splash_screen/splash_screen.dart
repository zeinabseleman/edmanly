import 'dart:async';
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/auth/login_screen/login_screen.dart';
import 'package:edmanly/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../generated/assets.dart';
import '../../constants/app_colors.dart';
import '../../core/shared_preference_class.dart';
import '../shared_widgets/text_widget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Timer(
          const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const LoginScreen()
              )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Image.asset(Assets.logo,width: 200.w,),
                    //Padding(padding: EdgeInsetsDirectional.only(top: 11.h)),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
