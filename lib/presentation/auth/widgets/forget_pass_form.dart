// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../constants/app_colors.dart';
// import '../../../constants/ui/ui_constants.dart';
// import '../../../utils/app_utils.dart';
// import '../../shared_widgets/btn_wiget.dart';
// import '../../shared_widgets/text_field.dart';
//
//
// class ForgetPasswordForm extends StatefulWidget {
//   const ForgetPasswordForm({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPasswordForm> createState() => _ForgetPasswordFormState();
// }
//
// class _ForgetPasswordFormState extends State<ForgetPasswordForm> {
//   TextEditingController updatePassController = TextEditingController();
//
//   final _formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           BoxInputField(
//             errorMessage: 'register_mobile_error',
//             controller: updatePassController,
//             placeholder: 'update_pass_phone'.tr,
//             validator: (v) {},
//           ),
//           SizedBox(
//             height: 24.h,
//           ),
//           BlocConsumer<AuthBloc, AuthState>(listener: (context, authState) {
//             if (authState is AuthFailedState) {
//               AppUtils.showToast(
//                   msg: authState.errorMsg, bgColor: errorColor);
//             }
//             if (authState is ForgetPasswordLoadedState) {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (_) => const VerifyPhoneNumber(
//                           comeFrom: VerifyCodeNavigation.fromForgetPassword)));
//             }
//           }, builder: (context, state) {
//             return state is AuthLoadingState
//                 ? spinKit
//                 : BtnWidget(
//                     width: 400.w,
//                     height: 50.h,
//                     txt: 'send_code'.tr,
//                     fontSize: 20,
//                     onClicked: () {
//                       if (_formKey.currentState!.validate()) {
//                         context.read<AuthBloc>().add(ForgetPasswordEvent(
//                             phone: updatePassController.text));
//                       }
//                     },
//                     colorTxt: white,
//                     colorBtn: primaryColor);
//           }),
//         ],
//       ),
//     );
//   }
// }
