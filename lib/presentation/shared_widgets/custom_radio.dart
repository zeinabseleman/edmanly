import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';

class CustomRadio<T> extends StatefulWidget {
  final T value;
  final T groupValue;
  final String title;
  final double? fontSize;
  final ValueChanged<T?> onChanged;

  const CustomRadio({super.key,
  required this.value, required this.groupValue,
  required this.title, required this.onChanged
  ,this.fontSize
  });

  @override
  State<CustomRadio<T>> createState() => _CustomRadioState<T>();
}

class _CustomRadioState<T> extends State<CustomRadio<T>> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 56.h,
        // decoration: BoxDecoration(
        //     color: Colors.white,
        //     borderRadius: BorderRadius.circular(4),
        //     border: Border.all(color: textColor,width: 1)
        // ),
        child: Row(
          children: [
            Radio(
              activeColor: primaryColor,
              value: widget.value,
              groupValue: widget.groupValue,
              onChanged: widget.onChanged
            ),
            TextWidget(
              widget.title.tr,
              fontSize: widget.fontSize?? 18.sp,
            ),
          ],
        )
    );
  }
}
