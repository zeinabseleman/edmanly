import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';

class GovernorateDropDown extends StatelessWidget {
  final bool isSelected;
  final String name;

  const GovernorateDropDown({super.key,
  required this.isSelected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: !isSelected
          ? null
          : BoxDecoration(
        border: Border.all(color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
      ),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWidget(name,align: TextAlign.start,)
      ),
    );
  }
}
