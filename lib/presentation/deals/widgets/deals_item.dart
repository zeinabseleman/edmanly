import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';

class DealsItem extends StatelessWidget {
final String name;
final Function()? onTap;

  const DealsItem({super.key, required this.name,this.onTap});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Row(
             children: [
               const TextWidget('-',),
               SizedBox(width: 5.w),
               TextWidget(name,)
             ],
          ),
        ),
        Divider()

      ],
    );
  }
}
