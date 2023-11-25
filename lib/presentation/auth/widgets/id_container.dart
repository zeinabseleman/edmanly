import 'dart:io';

import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IdContainer extends StatelessWidget {
final File? image;
final String text;

  const IdContainer({super.key, this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsetsDirectional.only(top: 8.h),
      width: 170.w,
      height: 130.h,
      child: image == null ? TextWidget(text.tr) : Image.file(image!),
    );
  }
}
