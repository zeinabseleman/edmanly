import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app_colors.dart';

final spinKit = SpinKitSquareCircle(
  color:  primaryColor,
  size: 20.0.w,
);

bool isSaved =false ;
List<int> savedList =[];

isSavedItem(int selected,
    Function() savedItem,
    Function() unSavedItem
    ) {
  final isExist = savedList.contains(selected);
  if(isExist){
    savedList.remove(selected);

    //call unsaved item bloc
    unSavedItem();

  }else{
    savedList.add(selected);
    isSaved = !isSaved;

    //call save to items bloc
    savedItem();
  }
}
bool isExist(int selected){
  final isExist = savedList.contains(selected);
  return isExist;
}