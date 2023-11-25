import 'package:edmanly/presentation/shared_widgets/profile_image.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/app_colors.dart';

class ReviewItem extends StatelessWidget {
final String image;
final String name;
final String review;

  const ReviewItem({super.key, required this.image, required this.name, required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: EdgeInsetsDirectional.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color:border,width: 1),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileImage(profileImage: image,radius: 20,),
              SizedBox(width: 8.w,),
              TextWidget(name,color: primaryColor,)
            ],
          ),
          TextWidget(review,align: TextAlign.start,)
        ],
      ),
    );
  }
}
