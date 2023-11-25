import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';
import '../../shared_widgets/text_widget.dart';

class DateContainer extends StatelessWidget {
final Function() onTap;
final String date;
final String name;

  const DateContainer({super.key, required this.onTap,
required this.name,required this.date});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextWidget(name.tr),
        InkWell(
          onTap: onTap,
          child:  Container(
            padding:  EdgeInsetsDirectional.only(start: 7.w),
            margin: EdgeInsetsDirectional.only(end: 40.w),
            decoration: BoxDecoration(
                border: Border.all(color:border,width: 1),
                borderRadius: BorderRadius.circular(5)
            ),
            child: Row(
              children: [
                TextWidget(
                  date,
                  fontSize: 15.sp,
                  color: primaryColor,
                ),
                const Icon(Icons.arrow_drop_down,size: 18,),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
