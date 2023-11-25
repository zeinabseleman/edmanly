import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../shared_widgets/btn_wiget.dart';

class UploadImageButton extends StatelessWidget {
final String title;
final Function() onTap;
final double? width;
final double? height;

  const UploadImageButton({super.key,
required this.title,
required this.onTap,
this.width,this.height
});
  @override
  Widget build(BuildContext context) {
    return  BtnWidget(
        width: width?? 170.w,
        height: height?? 80.h,
        txt: title.tr,
        fontSize:15,
        onClicked: onTap,
        colorTxt: white,
        colorBtn: primaryColor);
  }
}
