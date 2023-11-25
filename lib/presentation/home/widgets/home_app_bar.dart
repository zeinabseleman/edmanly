import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../../core/shared_preference_class.dart';
import '../../shared_widgets/profile_image.dart';

class HomeAppBar extends StatelessWidget {
final String name;
final bool? menu;
final Function()? onTap;

  const HomeAppBar({super.key, required this.name,
this.menu=false,this.onTap});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ProfileImage(profileImage: profileImageUrl),
            SizedBox(width: 10.w,),
            TextWidget(sharedPrefs.getName().toString())
          ],
        ),
        if(menu==true) InkWell(
            onTap:onTap,
            child: const Icon(
              Icons.menu_outlined,
              color: primaryColor,
              size: 30.0,
            )
        ),
      ],
    );
  }
}
