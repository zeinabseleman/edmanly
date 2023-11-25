import 'dart:developer';
import 'dart:io';
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/ui/ui_constants.dart';
import '../../../model/user_model.dart';
import '../../../utils/app_utils.dart';
import '../../shared_widgets/btn_wiget.dart';
import '../login_cubit/login_cubit.dart';
import '../user_data/user_data_cubit.dart';

class VerifyCodeForm extends StatefulWidget {
  final UserModel? userModel;
  final List<File>? images;
  final bool isLogin;
  const VerifyCodeForm({super.key, this.userModel, this.images,required this.isLogin});

  @override
  State<VerifyCodeForm> createState() => _VerifyCodeFormState();
}

class _VerifyCodeFormState extends State<VerifyCodeForm> {
  final TextEditingController controller = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: textColor, width: 1)),
            height: 65.h,
            width: 358.w,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeFields(
                controller: controller,
                length: 6,
                fieldBorderStyle: FieldBorderStyle.bottom,
                responsive: false,
                fieldHeight: 25,
                fieldWidth: 20.w,
                borderWidth: 1.0,
                activeBorderColor: primaryColor,
                activeBackgroundColor: Colors.white,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                autoHideKeyboard: false,
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                onComplete: (String value) {},
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, authState) {
              if (authState is VerifyCodeFailed) {
                AppUtils.showToast(msg: 'كود خطأ', bgColor: errorColor);
              }
              if (authState is VerifyCodeLoaded) {
                if(widget.isLogin==false){
                  context.read<UserDataCubit>().uploadFiles(
                      widget.images
                  );
                  context.read<UserDataCubit>().addUser(
                      widget.userModel!
                  );
                }

                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeScreen()));
              }
            },
            builder: (context, state) {
              return state is VerifyCodeLoading
                  ? spinKit
                  : BtnWidget(
                      width: 400.w,
                      height: 50.h,
                      txt: 'verify'.tr,
                      fontSize: 20,
                      onClicked: () {
                        if (_formKey.currentState!.validate()) {
                          context
                              .read<LoginCubit>()
                              .verifyCode(
                              controller.text
                          );
                        }
                      },
                      colorTxt: white,
                      colorBtn: primaryColor);
            },
          ),
          SizedBox(
            height: 11.h,
          ),
        ],
      ),
    );
  }
}
