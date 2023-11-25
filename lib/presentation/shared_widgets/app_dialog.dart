import 'package:flutter/material.dart';

class AppDialogContent extends StatefulWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final bool showCloseButton;
  final bool useMargin;
  final bool useCancelDefaultButton;
  final Function? onDoneButtonClicked;

  const AppDialogContent({super.key,
      this.child,
    this.height,
    this.width,
    this.showCloseButton = true,
    this.useCancelDefaultButton = true,
    this.useMargin = true,
    this.onDoneButtonClicked,
  }) : assert(child != null);

  @override
  State<StatefulWidget> createState() => AppDialogContentState();
}

class AppDialogContentState extends State<AppDialogContent>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation = CurvedAnimation(parent: controller!, curve: Curves.ease);

    controller!.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
