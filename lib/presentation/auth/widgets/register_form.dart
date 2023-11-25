
import 'dart:io';

import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/model/user_model.dart';
import 'package:edmanly/presentation/auth/widgets/terms_and_conditions.dart';
import 'package:edmanly/presentation/auth/widgets/upload_image_btn.dart';
import 'package:edmanly/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/ui/ui_constants.dart';
import '../../../core/models/drop_down_item.dart';
import '../../../core/shared_preference_class.dart';
import '../../../utils/app_utils.dart';
import '../../shared_widgets/btn_wiget.dart';
import '../../shared_widgets/custom_radio.dart';
import '../../shared_widgets/dropdown_search.dart';
import '../../shared_widgets/text_field.dart';
import '../../shared_widgets/text_widget.dart';
import 'package:image_picker/image_picker.dart';
import '../login_cubit/login_cubit.dart';
import '../register_screen/verify_phone.dart';
import '../user_data/user_data_cubit.dart';
import 'id_container.dart';


class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController jobController = TextEditingController();


  int? type = 1;



  final _formKey = GlobalKey<FormState>();
  DropDownItem? selectedGovernorate;
  DropDownItem? selectedCity;
  bool checkedValue = false;
  UserModel? userModel;
  List<File>? images;
  String? idForwardUrl;
  String? idBackUrl;
  String? receiptUrl;
  String? commercialRegisterUrl;
  String? taxFileUrl;
  DropDownItem? individualJobSelected;
  DropDownItem? commercialJobSelected;
  DropDownItem? OnlineJobSelected;




  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            'intro_register'.tr,
            fontSize: 20.sp,
          ),
          SizedBox(
            height: 40.h,
          ),
          BoxInputField(
            errorMessage: 'first_name',
            controller: firstNameController,
            placeholder: 'first_name'.tr,
          ),
          SizedBox(
            height: 24.h,
          ),
          BoxInputField(
            errorMessage: 'last_name',
            controller: lastNameController,
            placeholder: 'last_name'.tr,
          ),
          SizedBox(
            height: 20.h,
          ),
          BoxInputField(
            errorMessage: 'Enter_phone',
            controller: phoneController,
            placeholder: 'phone'.tr,
          ),
          SizedBox(
            height: 24.h,
          ),
          BoxInputField(
            errorMessage: 'Enter_password',
            password: true,
            controller: passwordController,
            placeholder: 'password'.tr,
          ),
          SizedBox(
            height: 24.h,
          ),
          UploadImageButton(
            width: 400.w,
            height: 50.h,
            title:'upload_profile_image',
            onTap: (){pickedProfileImage();},
          ),
          if(profileImage!=null)
            Center(
              child: IdContainer(
                text: '',
                image: profileImage,
              ),
            ),
          SizedBox(
            height: 24.h,
          ),
          Dropdown(
              hint: 'governorate'.tr,
              hintColor: textColor,
              selectedColor: textColor,
              data: governorate,
              selectedItem: selectedGovernorate,
              search: false,
              showSearchBox: false,
              onChanged: (v) {
                setState(() {
                  selectedGovernorate = v;
                });
              }),

          SizedBox(
            height: 24.h,
          ),
          Dropdown(
              hint: 'city'.tr,
              hintColor: textColor,
              selectedColor: textColor,
              data: selectedGovernorate?.name=='القاهرة'
              ?cairoCity:selectedGovernorate?.name=='الجيزة'
              ?gezaCity:alexandriaCity,
              selectedItem: selectedCity,
              search: false,
              showSearchBox: false,
              onChanged: (v) {
                setState(() {
                  selectedCity = v;
                });
              }),

          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadio(
                title: 'individual',
                value: 1,
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = value;
                    print('type=$type');
                  });
                },
              ),
              CustomRadio(
                title: 'commercial',
                value: 2,
                groupValue: type,
                onChanged: (value) {
                  setState(() {
                    type = value;
                    print('type=$type');
                  });
                },
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          (type==1)
          ?Dropdown(
              hint: 'job'.tr,
              hintColor: textColor,
              selectedColor: textColor,
              data: individualJobs,
              errorMessage: '',
              selectedItem: individualJobSelected,
              search: false,
              showSearchBox: false,
              onChanged: (v) {
                setState(() {
                  individualJobSelected = v;
                });
              })
              :Dropdown(
              hint: 'commercial_job'.tr,
              hintColor: textColor,
              selectedColor: textColor,
              data: commercialJobs,
              selectedItem: commercialJobSelected,
              search: false,
              showSearchBox: false,
              onChanged: (v) {
                setState(() {
                  commercialJobSelected = v;
                });
              }),
          SizedBox(
            height: 20.h,
          ),
          if(type==2 && commercialJobSelected!=null
              &&commercialJobSelected!.name=='تاجر أونلاين')
            Dropdown(
                hint: 'job_section'.tr,
                hintColor: textColor,
                selectedColor: textColor,
                data: OnlineMerchant,
                selectedItem:OnlineJobSelected ,
                search: false,
                showSearchBox: false,
                onChanged: (v) {
                  setState(() {
                    OnlineJobSelected = v;
                  });
                }),
          SizedBox(
            height: 20.h,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UploadImageButton(
                title:'upload_id_forward',
                onTap: (){pickIdForward();},
              ),
              UploadImageButton(
                title:'upload_id_back',
                onTap: (){pickIdBack();},
              )
            ],
          ),
         if(idForward!=null || idBack!=null)
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               IdContainer(
                 text: 'No_image_selected_forward',
                 image: idForward,
               ),
               IdContainer(
                 text: 'No_image_selected_back',
                 image: idBack,
               ),
             ],
           ),
          SizedBox(
            height: 20.h,
          ),
          if(type==1)
            Column(
              children: [
                UploadImageButton(
                  width: 400.w,
                  height: 50.h,
                  title:'Latest_electricity_receipt',
                  onTap: (){pickElectricityReceipt();},
                ),
                if(receipt!=null)
                  IdContainer(
                    text: '',
                    image: receipt,
                  ),
              ],
            ),

          if(type==2)
            Column(
              children: [
                UploadImageButton(
                  width: 400.w,
                  height: 50.h,
                  title:'commercial_register',
                  onTap: (){pickCommercialRegister();},
                ),
                if(commercialRegister!=null)
                  IdContainer(
                    text: '',
                    image: commercialRegister,
                  ),
                SizedBox(height: 15.h,),
                UploadImageButton(
                  width: 400.w,
                  height: 50.h,
                  title:'Tax_file',
                  onTap: (){pickTexFile();},
                ),
                if(taxFile!=null)
                  IdContainer(
                    text: '',
                    image: taxFile,
                  ),
              ],
            ),

          SizedBox(
            height: 20.h,
          ),
           TermsAndConditions(
             checkedValue: checkedValue,
             onchange: (newValue) {
               setState(() {
                 checkedValue = newValue!;
                 print('val${checkedValue}');
               });
             },
           ),
          SizedBox(
            height: 30.h,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, authState) {
               if (authState is RegisterFailed) {
                AppUtils.showToast(
                      msg:"الايميل او رقم رقم الموبايل مستخدم" , bgColor: errorColor);

              }
              if (authState is RegisterLoaded) {
                context.read<UserDataCubit>().uploadFiles(
                     images
                );
                context.read<UserDataCubit>().addUser(
                    userModel!
                );
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const HomeScreen()));
              }

            },
            builder: (context, state) {
              return state is RegisterLoading
                  ? spinKit
                  :  BtnWidget(
                  width: 400.w,
                  height: 50.h,
                  txt: 'register'.tr,
                  fontSize: 20,
                  onClicked: () {
                    if ((_formKey.currentState!.validate()&&
                        idForward!=null&&idBack!=null&&checkedValue==true&&profileImage!=null)
                       &&(type==1&&receipt!=null)||(type==2&&commercialRegister!=null&&taxFile!=null)
                    ) {

                      if(phoneController.text.length==11&&!phoneController.text.contains('@')){
                        context.read<LoginCubit>().signInWithPhoneNumber(
                            phoneController.text
                        );
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>  VerifyPhoneNumber(
                                  userModel: userModel,
                                    images: images,
                                  isLogin: false,
                                )));

                      }else{
                        context.read<LoginCubit>().registerWithEmailAndPassword(
                            phoneController.text,
                            passwordController.text
                        );
                      }
                      userModel = UserModel(
                          name: firstNameController.text+' '+lastNameController.text,
                          governate:selectedGovernorate!.name ,
                          city: selectedCity!.name,
                          email: phoneController.text,
                          type: type==1?'فرد':'تجارى',
                          individualJob: individualJobSelected==null?'':individualJobSelected!.name,
                          commercialJob: commercialJobSelected==null?'':commercialJobSelected!.name,
                          onlineMerchantJob:OnlineJobSelected==null?'':OnlineJobSelected!.name ,
                          idImageForward: idForwardUrl!,
                          idImageBack: idBackUrl!,
                          electricityReceipt:receiptUrl==null?'': receiptUrl!,
                          commercialRegister:commercialRegisterUrl==null?'': commercialRegisterUrl!,
                          taxFile:taxFileUrl==null?'': taxFileUrl!,
                          profileImage: profileImageUrl!
                      );
                      images= [
                        idForward!,
                        idBack!,
                        if(type==1) receipt!,
                        if(type==2) commercialRegister!,
                        if(type==2) taxFile!,
                        profileImage!
                      ];
                      sharedPrefs.setName(firstNameController.text+' '+lastNameController.text);
                      sharedPrefs.setGovernorate(selectedGovernorate!.name);
                      sharedPrefs.setCity(selectedCity!.name);
                      sharedPrefs.setAccountTye(type==1?'فرد':'تجارى');


                    }else if(profileImage==null){
                      AppUtils.showToast(
                          msg:"يجب تحميل الصورة الشخصية" , bgColor: errorColor);
                    }
                    else if(idForward==null||idBack==null){
                      AppUtils.showToast(
                          msg:"يجب تحميل صورة البطاقه" , bgColor: errorColor);

                    }else if(checkedValue==false){
                      AppUtils.showToast(
                          msg:"يجب الموافقه علي شروط الخدمات وسياسه الخصوصية" , bgColor: errorColor);
                    }else if(type==1&&receipt==null){
                      AppUtils.showToast(
                          msg:"يجب تحميل اخر ايصال كهرباء" , bgColor: errorColor);

                    }else if(type==2&&commercialRegister==null||taxFile==null){
                      AppUtils.showToast(
                          msg:" يجب تحميل الملف الضريبي والسجل التجاري" , bgColor: errorColor);

                    }
                  },
                  colorTxt: white,
                  colorBtn: primaryColor);
            },
          ),
        ],
      ),
    );
  }

  File? idForward;
  File? idBack;
  File? receipt;
  File? commercialRegister;
  File? taxFile;
  File? profileImage;


  Future pickedProfileImage() async {
    try {
      final profileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (profileImage == null) return;
      final imageTemp = File(profileImage.path);
      profileImageUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.profileImage = imageTemp);

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickIdForward() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null) return;
      final imageTemp = File(picked.path);
      idForwardUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.idForward = imageTemp);

    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickIdBack() async {
    try {
      final idBack = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (idBack == null) return;
      final imageTemp = File(idBack.path);
      idBackUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.idBack = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickElectricityReceipt() async {
    try {
      final receipt = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (receipt == null) return;
      final imageTemp = File(receipt.path);
      receiptUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.receipt = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickCommercialRegister() async {
    try {
      final commercialRegister = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (commercialRegister == null) return;
      final imageTemp = File(commercialRegister.path);
      commercialRegisterUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.commercialRegister = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  Future pickTexFile() async {
    try {
      final taxFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (taxFile == null) return;
      final imageTemp = File(taxFile.path);
      taxFileUrl = await context.read<UserDataCubit>().uploadImage(
          imageTemp
      );
      setState(() => this.taxFile = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
}
