import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/profile_image.dart';
import 'package:edmanly/presentation/shared_widgets/rating_item.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class DropDownItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  final String accountType;
  final String job;
  final String governate;
  final String city;
  final String profileImage;


  const DropDownItem({required this.isSelected,
    required this.name, Key? key,
    required this.accountType,required this.job,
    required this.city,required this.governate,required this.profileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: EdgeInsetsDirectional.only(start:15.w,end: 15.w,bottom: 10.h),
      decoration: BoxDecoration(
              border: Border.all(color: border.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
      child: Row(
        children: [
         ProfileImage(profileImage: profileImage),
         SizedBox(width: 10.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                'name'.tr +' '+ name,
                height: 1,
              ),
              if(job!='')TextWidget(
                'job_search'.tr +' ' +job,
              ),
              TextWidget(
                'account_type'.tr +' ' +accountType,
              ),
              SizedBox(height: 6.h,),
              TextWidget(
                'governorate'.tr +': ' +governate,
              ),
              TextWidget(
                'city'.tr  +': '+city,
              ),
              // Row(
              //   children: [
              //     TextWidget(
              //       'Evaluation'.tr,
              //       height: 1,
              //     ),
              //     RatingItem(rate: rate,)
              //   ],
              // ),

            ],
          ),

        ],
      ),
    );
  }
}
