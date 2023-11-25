import 'dart:io';

import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/deals/widgets/new_deal_text.dart';
import 'package:edmanly/presentation/deals/widgets/new_deal_item.dart';
import 'package:edmanly/presentation/deals/widgets/signature_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../constants/app_colors.dart';
import '../auth/widgets/id_container.dart';
import '../auth/widgets/upload_image_btn.dart';
import '../shared_widgets/btn_wiget.dart';
import '../shared_widgets/custom_radio.dart';
import '../shared_widgets/screen_main_widget.dart';
import '../shared_widgets/text_field.dart';
import '../shared_widgets/text_widget.dart';

class NewDeals extends StatefulWidget {
  const NewDeals({Key? key}) : super(key: key);

  @override
  State<NewDeals> createState() => _NewDealsState();
}

class _NewDealsState extends State<NewDeals> {
  int? type=1;
  TextEditingController dealNameController = TextEditingController();
  TextEditingController dealTextController = TextEditingController();
  TextEditingController amountController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return ScreenMainWidget(
        title: 'new_deals'.tr,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget('Type_of_deal'.tr),
                CustomRadio(
                  title: 'sell_and_buy',
                  value: 1,
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
                CustomRadio(
                  title: 'rent',
                  value: 2,
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
                CustomRadio(
                  title: 'General_deal',
                  value: 3,
                  groupValue: type,
                  onChanged: (value) {
                    setState(() {
                      type = value;
                    });
                  },
                ),
                SizedBox(height: 20.h,),
                NewDealItem(
                  name: 'deal_name',
                  errorMsg:'enter_deal_name',
                  controller:dealNameController
                ),
                SizedBox(height: 20.h,),
                NewDealText(
                startDate: DateFormat('dd/MM/yyyy')
                    .format(startDate)
                    .toString(),
                  selectedStartDate: () {
                     selectStartDate(context);
                  },
                  endDate:DateFormat('dd/MM/yyyy')
                      .format(endDate)
                      .toString(),
                  selectedSEndDate:(){selectEndDate(context);},
                  amountController: amountController ,
                  dealTextController: dealTextController,
                ),
                SizedBox(height: 10.h,),
                Column(
                  children: [
                    UploadImageButton(
                      width: 400.w,
                      height: 50.h,
                      title:'deal_image',
                      onTap: (){pickDealImage();},
                    ),
                    if(dealImage!=null)
                      IdContainer(
                        text: '',
                        image: dealImage,
                      ),
                  ],
                ),
                SizedBox(height: 20.h,),
                const SignatureItem(
                  firstSignature: '',
                  secondSignature: '',
                ),
                SizedBox(height: 30.h,),
                BtnWidget(
                    width: 400.w,
                    height: 50.h,
                    txt: 'sharing'.tr,
                    fontSize: 20,
                    onClicked: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    },
                    colorTxt: white,
                    colorBtn: primaryColor)

              ]
          )
        )


    );
  }
  DateTime startDate = DateTime.now();
  Future<DateTime?> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2050));
    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });

    }
    return picked;
  }

  DateTime endDate = DateTime.now();
  Future<DateTime?> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2023),
        lastDate: DateTime(2050));
    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });

    }
    return picked;
  }

  File? dealImage;
  Future pickDealImage() async {
    try {
      final dealImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (dealImage == null) return;
      final imageTemp = File(dealImage.path);
      setState(() => this.dealImage = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
