import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../shared_widgets/text_field.dart';
import 'date_container.dart';
import 'new_deal_item.dart';

class NewDealText extends StatelessWidget {
final String startDate;
final String endDate;
final Function()? selectedStartDate;
final Function()? selectedSEndDate;
final TextEditingController amountController;
final TextEditingController dealTextController;

  const NewDealText({super.key
,this.selectedStartDate,this.startDate='',
this.endDate='',this.selectedSEndDate,
required this.amountController,required this.dealTextController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          margin: EdgeInsetsDirectional.only(bottom: 10.h),
          decoration: BoxDecoration(
              border: Border.all(color:border,width: 1),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DateContainer(
                name: 'start_date_deal',
                date: startDate,
                onTap: selectedStartDate!,
              ),
              SizedBox(height: 10.h,),
              DateContainer(
                name: 'end_date_deal',
                date: endDate,
                onTap: selectedSEndDate!,
              ),
              SizedBox(height: 10.h,),
              NewDealItem(name: 'total_amount_required'
                  , controller: amountController, errorMsg: '',),
              SizedBox(height: 10.h,),
              TextWidget('Text_of_deal'.tr),
              SizedBox(height: 10.h,),
              BoxInputField(
                errorMessage: 'enter_text_of_deal',
                controller: dealTextController,
                placeholder: '',
                maxLines: 6,
                isNote: true,

              ),

            ],
          )
        ),
      ],
    );
  }
}
