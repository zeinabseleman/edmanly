import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../shared_widgets/text_widget.dart';

class SelectedDealText extends StatelessWidget {
  final String text;

  const SelectedDealText({super.key, required this.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget('Text_of_deal'.tr,color: primaryColor,),
        SizedBox(height: 10.h,),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            margin: EdgeInsetsDirectional.only(bottom: 10.h),
            decoration: BoxDecoration(
                border: Border.all(color:border,width: 1),
                borderRadius: BorderRadius.circular(5)
            ),
            child:TextWidget(
              text,
              align: TextAlign.start,
            )
        ),
      ],
    );
  }
}
