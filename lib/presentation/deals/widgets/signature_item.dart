import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class SignatureItem extends StatelessWidget {
final String firstSignature;
final String secondSignature;

  const SignatureItem({super.key, required this.firstSignature, required this.secondSignature});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            TextWidget('Signature_first_party'.tr),
            TextWidget(firstSignature)
          ],
        ),
        Column(
          children: [
            TextWidget('Signature_second_party'.tr),
            TextWidget(secondSignature)
          ],
        ),
      ],
    );
  }
}
