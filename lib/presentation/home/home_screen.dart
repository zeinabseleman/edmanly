import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:edmanly/constants/ui/ui_constants.dart';
import 'package:edmanly/core/extensions/string_ext.dart';
import 'package:edmanly/model/user_model.dart';
import 'package:edmanly/presentation/home/widgets/home_app_bar.dart';
import 'package:edmanly/presentation/shared_widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/app_colors.dart';
import '../../core/models/drop_down_item.dart';
import '../../generated/assets.dart';
import '../auth/user_data/user_data_cubit.dart';
import '../deals/new_deals_screen.dart';
import '../drawer_page/drawer.dart';
import '../shared_widgets/btn_wiget.dart';
import '../shared_widgets/dropdown_search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  UserModel? selectedUser;

  void openDrawer() {
    _scaffoldKey.currentState!.openDrawer();
  }
  @override
  void initState() {
  context.read<UserDataCubit>().getAllUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   SafeArea(
        top: Platform.isAndroid ? true : false,
        bottom: false,
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          key: _scaffoldKey,
           drawer: DrawerPage(),
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w,vertical: 20.h),
            child:  Column(
              children: [
                 HomeAppBar(
                    name: 'محمد محمد',
                  menu: true,
                  onTap: (){openDrawer();}
                ),
                SizedBox(height: 30.h,),
                TextWidget('search_for_user'.tr,color: primaryColor,),
                SizedBox(height: 20.h,),
                BlocBuilder<UserDataCubit, UserDataState>(
                  builder: (context, state) {
                    if (state is UsersLoaded) {
                      return state.users.isEmpty
                      ? TextWidget('لا يوجد مستخدمين')
                           :Dropdown(
                          hint: 'Name_account_type'.tr,
                          hintColor: textColor,
                          selectedColor: textColor,
                          search: true,
                          data: state.users,
                          selectedItem: selectedUser,
                          onChanged: (v) {
                            setState(() {
                              selectedUser = v;
                            });
                          });
                    }else if(state is UsersLoading){
                      return spinKit;
                    } else {
                      return const SizedBox();
                    }

                  },
                ),
                SizedBox(height: 100.h,),
                BtnWidget(
                    width: 300.w,
                    height: 50.h,
                    txt: 'Create_new_agreement'.tr,
                    fontSize: 15,
                    onClicked: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => const NewDeals()
                      ));
                    },
                    colorTxt: white,
                    colorBtn: primaryColor)
              ],
            ),
          )
        ));
  }

}
