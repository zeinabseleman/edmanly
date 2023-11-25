import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';

class BoxInputField extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final String title;
  final bool? isHeading;
  final bool? isRequired;
  final Widget? leading;
  final Widget? trailing;
  final bool password;
  final Color? color;
  final TextAlign? textAlign;
  final void Function()? trailingTapped;
  final void Function(String)? onchange;
  final Function(String?)? validator;
  final List<TextInputFormatter>? textInputFormatter;
  final OutlineInputBorder? onFocusBorder;
  final OutlineInputBorder? onErrorBorder;
  final OutlineInputBorder? border;
  final OutlineInputBorder? onEnabledBorder;
  final OutlineInputBorder? disabledBorder;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String? val)? validate;
  final String errorMessage;
  final bool? autofocus;
  final int? maxLines;
  final bool isNote;
  const BoxInputField({
    Key? key,
    required this.controller,
    this.placeholder = '',
    this.textInputFormatter,
    this.isRequired = false,
    this.validator,
    this.validate,
    this.errorMessage = '',
    this.onchange,
    this.isHeading = false,
    this.title = '',
    this.leading,
    this.textAlign,
    this.trailing,
    this.trailingTapped,
    this.password = false,
    this.color,
    this.border,
    this.onEnabledBorder,
    this.onFocusBorder,
    this.onErrorBorder,
    this.disabledBorder,
    this.textInputAction,
    this.onFieldSubmitted,
    this.autofocus,
    this.maxLines,
    this.isNote=false
  }) : super(key: key);

  @override
  State<BoxInputField> createState() => _BoxInputFieldState();
}

class _BoxInputFieldState extends State<BoxInputField> {
  bool showPassword = true;
  @override
  Widget build(BuildContext context) {
    return Theme(
      /// Overriding the default blue color.
      ///
      /// We can also avoid this by changing the [primarySwatch] in MaterialApp
      data: ThemeData(primaryColor: primaryColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: widget.isHeading == true ? 12 : 0,
          ),
          TextFormField(
            textAlign: widget.textAlign ?? TextAlign.start,
            inputFormatters: widget.textInputFormatter,
            maxLines:widget.isNote==true ? widget.maxLines:1 ,
            validator: (widget.validate == null)
                ? (value) {
                    if (value == null || value.isEmpty && widget.errorMessage != '') {
                      return widget.errorMessage.tr;
                    }
                    return null;
                  }
                : widget.validate,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: widget.controller,
            style: const TextStyle(height: 1.2, color: black),
            obscureText: (widget.password) ? showPassword : widget.password,
            decoration: InputDecoration(
              hintText: widget.placeholder,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              filled: true,
              fillColor: widget.color ?? white,
              enabled: true,
              disabledBorder: widget.disabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: const BorderSide(
                      color: textColor,
                    ),
                  ),
              prefixIcon: widget.leading,
              prefixIconConstraints: BoxConstraints(
                maxWidth: 30.w,
                minWidth: 30.w,
                maxHeight: 18.h,
                minHeight: 18.h
              ),
              suffixIcon: (widget.password)
                  ? InkWell(
                      onTap: () {
                        showPassword = !showPassword;
                        setState(() {});
                      },
                      child: (!showPassword)
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    )
                  : widget.trailing,
              border: widget.border ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: textColor,
                    ),
                  ),
              enabledBorder: widget.onEnabledBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: textColor,
                    ),
                  ),
              focusedBorder: widget.onFocusBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: textColor,
                    ),
                  ),
              errorBorder:
              widget.onErrorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: errorColor,
                    ),
                  ),
              focusedErrorBorder: widget.onErrorBorder ??
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: const BorderSide(
                      color: errorColor,
                    ),
                  ),
            ),
            onChanged: widget.onchange ?? (value) {},
            autofocus: widget.autofocus ?? false,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
          ),
        ],
      ),
    );
  }
}
