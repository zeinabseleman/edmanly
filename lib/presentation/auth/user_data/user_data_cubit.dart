import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/app_colors.dart';
import '../../../model/user_model.dart';
part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {

  UserDataCubit() : super(UserDataInitial());
  

  static UserDataCubit get(context)=> BlocProvider.of(context);
  List<UserModel> data=[];

  Future addUser(UserModel userModel) async{
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    userModel.id = docUser.id;
    final json = userModel.toJson();
    await docUser.set(json);
      print("Data added successfully");

  }

  getAllUsers() async {
    print("Active Users");
    var val = await FirebaseFirestore.instance
        .collection("users")
        .get();
    var documents = val.docs;
    if (documents.length > 0) {
      try {
            emit(UsersLoading());
        print("Active ${documents.length}");
        return documents.map((document) {
          UserModel userModel = UserModel.fromJson(Map<String, dynamic>.from(document.data()));
          data.add(userModel);
        emit(UsersLoaded(data));
        }).toList();
      } catch (e) {
        print("Exception $e");
        emit(UsersFailed());
      }
    }

  }
  Future<List<String>> uploadFiles(List<File>? _images) async {
    var imageUrls = await Future.wait(_images!.map((_image) => uploadImage(_image)));
    print(imageUrls);
    return imageUrls;
  }

  Future<String> uploadImage(File _image) async {
    var storageRef = FirebaseStorage.instance
        .ref()
        .child('images/${_image.path}');
    await storageRef.putFile(_image);
    return await storageRef.getDownloadURL();
  }

}


