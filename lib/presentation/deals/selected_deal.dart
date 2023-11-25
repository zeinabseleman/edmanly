import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/deals/widgets/new_deal_text.dart';
import 'package:edmanly/presentation/deals/widgets/selected_deal_text.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../shared_widgets/btn_wiget.dart';
import '../shared_widgets/screen_main_widget.dart';

class SelectedDeal extends StatelessWidget {
final String title;
final bool? isClosed;

  const SelectedDeal({super.key, required this.title,this.isClosed=false});
  @override
  Widget build(BuildContext context) {
    return ScreenMainWidget(
        title: title,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextWidget('deal_name'.tr,color: primaryColor,),
                  SizedBox(width: 5.w,),
                  const TextWidget('سباكة سباكة سباكة '),
                ],
              ),
              SizedBox(height: 20.h,),
              const SelectedDealText(text:
              'سباكة سباكة سباكة سباكة سباكة سباكة سباكة سباكة سباكة '),
              SizedBox(height: 60.h,),
              if(isClosed ==false) Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnWidget(
                      width: 150.w,
                      height: 50.h,
                      txt: 'Signature'.tr,
                      fontSize: 20,
                      onClicked: () {},
                      colorTxt: white,
                      colorBtn: primaryColor),
                  BtnWidget(
                      width: 150.w,
                      height: 50.h,
                      txt: 'edit'.tr,
                      fontSize: 20,
                      onClicked: () {},
                      colorTxt: white,
                      colorBtn: primaryColor)
                ],
              )

            ]
        )


    );
  }
}
