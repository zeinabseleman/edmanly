
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/deals/closed_deals.dart';
import 'package:edmanly/presentation/shared_widgets/profile_image.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../core/shared_preference_class.dart';
import '../../generated/assets.dart';
import '../deals/on_progress_deals_screen.dart';
import '../deals/pending_deals_screen.dart';
import '../profile/profile_screen.dart';
import '../shared_widgets/profile_item.dart';

class DrawerPage extends Drawer {
  DrawerPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.0,
      height: double.infinity,
      child: Drawer(
        child: Container(
          padding:EdgeInsetsDirectional.only(start: 10.w,end: 10.w,bottom: 20.h),
          color: scaffoldBackgroundColor,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
             DrawerHeader(
                  duration: Duration(seconds: 5),
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.only(top: 40.h),
                  curve: Curves.easeInOut,
                  child:   Column(
                    children: [
                      ProfileImage(radius: 40,profileImage: profileImageUrl),
                      TextWidget(sharedPrefs.getName().toString())
                    ],
                  ),
                ),

                 SizedBox(height: 30.h,),

                 ProfileItem(
              title: 'profile_screen'.tr,
             icon: Icons.person,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const ProfileScreen()
              ));
            },
          ),
                ProfileItem(
                  title: 'closed_deals'.tr,
                  icon: Icons.note,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const ClosedDeals()
                    ));
                  },
                ),
                ProfileItem(
                  title: 'onProgress_deals'.tr,
                  icon: Icons.note,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const OnProgressDeals()
                    ));
                  },
                ),
                ProfileItem(
                  title: 'Pending_deals'.tr,
                  icon: Icons.note,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => const PendingDeals()
                    ));
                  },
                ),
                ProfileItem(
                  title: 'home'.tr,
                  icon: Icons.home,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ProfileItem(
                  title: 'اللغة',
                  icon: Icons.language,
                  onTap: () {
                  },
                ),




              ]
      ),
          ),
    )));
  }


}
