import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../shared_widgets/btn_wiget.dart';
import '../../shared_widgets/text_widget.dart';

class SocialButton extends StatelessWidget {
final String title;
String icon;
VoidCallback onClicked;


   SocialButton({super.key, required this.title,required this.icon,required this.onClicked});
  @override
  Widget build(BuildContext context) {
    return
    BtnWidget(
    width: 150.w,
    height: 50.h,
    txt: '',
    fontSize: 20,
    onClicked: onClicked,
    colorTxt: white,
    colorBtn: primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextWidget(
              title.tr,
              color: white,
            ),
            Image.asset(icon,color: Colors.white,width: 50,)
          ],
        )
    );

  }
}
