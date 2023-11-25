import 'package:dropdown_search/dropdown_search.dart';
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../core/shared_preference_class.dart';
import 'dropdown_item.dart';
import 'governate_drop_down.dart';

class Dropdown extends StatefulWidget {
  final List data;
  final bool showSearchBox;
  final bool enabled;
  final bool showBorder;
  final Color selectedColor;
  final dynamic selectedItem;
  final Color hintColor;
  final TextStyle? baseStyle;
  final bool search;
  final Function(dynamic)? onChanged;
  final String hint;
  final String? errorMessage;
  const Dropdown(
      {required this.data,
      this.baseStyle,
      required this.selectedItem,
      required this.onChanged,
      this.selectedColor = selectedDRopItem,
      this.showSearchBox = true,
      this.showBorder =   true,
      required this.hint,
      this.enabled = true,
      this.hintColor = Colors.white,
        this.search=false,
        this.errorMessage,
      Key? key})
      : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownSearch<dynamic>(
      enabled: widget.enabled,
      popupProps: PopupProps.menu(
        showSearchBox: widget.showSearchBox,
        showSelectedItems: false,
        itemBuilder: (context, item, bool isSelected) {
          return (widget.search==true)
          ? DropDownItem(
            name: item.name,
            isSelected: isSelected,
            job:(item.individualJob!='')?item.individualJob
            :item.onlineMerchantJob==''
            ?item.commercialJob:item.commercialJob +'\n('+item.onlineMerchantJob+')',
            accountType: item.type,
            governate: item.governate,
            city: item.city,
            profileImage:item.profileImage ,
          )
              :GovernorateDropDown(
            name: item.name.toString(),
            isSelected: isSelected,
          );
        },
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        textAlignVertical: TextAlignVertical.top,
        baseStyle: widget.baseStyle ?? TextStyle(color: widget.selectedColor),
        dropdownSearchDecoration: InputDecoration(
            contentPadding: EdgeInsetsDirectional.only(start: 10.w, top: 10.h),
            iconColor: widget.selectedColor,
            prefixIcon: (widget.showSearchBox == true)
                ? Padding(
                    padding: EdgeInsets.only(
                        right: sharedPrefs.getLanguage() == "ar" ? 0.w : 10.w,
                        left: sharedPrefs.getLanguage() == "ar" ? 10.w : 0.w),
                    child: const Icon(
                      Icons.search,
                    ),
                  )
                : const SizedBox(),
            prefixIconConstraints:
                BoxConstraints(maxWidth: 30.w, maxHeight: 30.h),
            hintText: widget.hint,
            hintStyle: TextStyle(color: widget.hintColor),
            border: OutlineInputBorder(
                borderSide: widget.showBorder
                    ? BorderSide(
                        color: Colors.black,
                        width: 1.w,
                      )
                    : BorderSide.none),
            isDense: true,
            isCollapsed: true),
      ),
      items: widget.data,
      selectedItem: widget.selectedItem,
      itemAsString: (u) => u.name.toString().tr,
      onChanged: widget.onChanged,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if(widget.errorMessage==''){
          return null;
        }else{
          return widget.selectedItem == null ? "اختر" : null;
        }

      },
      filterFn: (instance, filter) {
        if (((instance.name ?? "").toLowerCase())
            .contains(filter.toLowerCase())) {
          return true;
        } else {
          return false;
        }
      },
    );
  }
}
