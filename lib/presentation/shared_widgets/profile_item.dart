import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../generated/assets.dart';

class ProfileItem extends StatelessWidget {
final IconData icon;
final String title;
final Function()? onTap;

  const ProfileItem({super.key,
required this.icon,
required this.title,
this.onTap,
});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                 Icon(icon ,color:primaryColor),
                  SizedBox(width: 19.w),
                  TextWidget(
                    title.tr,
                    fontSize: 18.sp,
                    color: border,

                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 17.h,),
      ],
    );
  }
}
