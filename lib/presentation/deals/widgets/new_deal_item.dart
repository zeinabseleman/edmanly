import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared_widgets/text_field.dart';
import '../../shared_widgets/text_widget.dart';

class NewDealItem extends StatelessWidget {
final String name;
final String errorMsg;
final TextEditingController controller;

  const NewDealItem({super.key, required this.name,
required this.controller,required this.errorMsg});
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(name.tr),
          SizedBox(height: 5.h,),
          BoxInputField(
            errorMessage: errorMsg,
            controller: controller,
            placeholder: '',
          ),
        ]
    );
  }
}
