import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_colors.dart';

class HaveAccountItem extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final Color?  color;

  const HaveAccountItem(
      {super.key,
      this.onTap,
      required this.title,
       this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: TextWidget(
        title.tr,
        color: color?? errorColor,

      )
    );
  }
}
