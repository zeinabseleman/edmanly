
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/core/shared_preference_class.dart';
import 'package:edmanly/presentation/profile/widgets/review_item.dart';
import 'package:edmanly/presentation/shared_widgets/profile_image.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../generated/assets.dart';
import '../shared_widgets/rating_item.dart';
import '../shared_widgets/screen_main_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenMainWidget(
      title: '',
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Center(child: Column(
            children: [
              ProfileImage(radius: 50,profileImage: profileImageUrl),
              TextWidget(
             sharedPrefs.getName().toString()
              ),
            ],
          )),
          SizedBox(height: 30.h,),

          SizedBox(height: 15.h,),
          TextWidget(
              'account_type'.tr + sharedPrefs.getAccountTye().toString()
          ),
          SizedBox(height: 15.h,),
          TextWidget(
              'governorate'.tr +':'+ sharedPrefs.getGovernorate().toString()
          ),
          SizedBox(height: 15.h,),
          TextWidget(
              'National_iD'.tr +'121313136565'
          ),
          SizedBox(height: 15.h,),
          Row(
            children: [
              TextWidget(
                'Evaluation'.tr,
                height: 1,
              ),
              const RatingItem(rate: 4,)
            ],
          ),
          SizedBox(height: 15.h,),
          TextWidget(
              'reviews'.tr
          ),
          Column(
            children: List.generate(
              5,
                  (index) => const ReviewItem(
                image: 'https://firebasestorage.googleapis.com/v0/b/edmanly-c426c.appspot.com/o/images%2Fdata%2Fuser%2F0%2Fcom.example.edmanly%2Fcache%2F307c369a-7622-495b-b445-957163b70af9%2FScreenshot_20230329-195735.png?alt=media&token=9fb718e4-96b7-4825-99a4-171dcdb5f7cf',
                name: 'محمد محمد ',
                review: 'خدمه ممتازه خدمه ممتازه خدمه ممتازه خدمه ممتازه ' ,
              ),
            ),
          )


        ],
      ),

    );
  }
}
