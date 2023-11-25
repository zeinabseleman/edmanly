import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../forget_password_screen/forget_password.dart';
import '../register_screen/register_screen.dart';
import 'have_account_item.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HaveAccountItem(
          title: 'new_account',
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const RegisterScreen()));
          },
        ),
        // HaveAccountItem(
        //   title: 'forget_password',
        //   color: textColor,
        //   onTap: () {
        //     // Navigator.push(
        //     //     context,
        //     //     MaterialPageRoute(
        //     //         builder: (_) => const ForgetPassword()));
        //   },
        // ),
      ],
    );
  }
}
