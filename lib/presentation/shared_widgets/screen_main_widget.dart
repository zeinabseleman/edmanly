import 'dart:io';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';

class ScreenMainWidget extends StatefulWidget {
  final Widget child;
  final String title;
  const ScreenMainWidget(
      {super.key,
      required this.child,
      required this.title,
     });

  @override
  State<ScreenMainWidget> createState() => _ScreenMainWidgetState();
}

class _ScreenMainWidgetState extends State<ScreenMainWidget> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: Platform.isAndroid ? true : false,
        bottom: false,
        child: Scaffold(
           backgroundColor: scaffoldBackgroundColor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_outlined,color: border, ), onPressed: () {
              Navigator.pop(context);
            },
            ),
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: EdgeInsetsDirectional.only(top: 10.h),
              child: TextWidget(widget.title,fontSize: 16,
                height: 1.5,color: primaryColor,),
            ),
          ),

          body:
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 50.h),
            child:  SingleChildScrollView(
              child:  widget.child,
            ),
          )

        ));
  }
}
