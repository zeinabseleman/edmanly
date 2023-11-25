part of 'user_data_cubit.dart';


abstract class UserDataState {}

class UserDataInitial extends UserDataState {}

class UsersLoading extends UserDataInitial {}

class UsersLoaded extends UserDataInitial {
  List<UserModel> users;
  UsersLoaded(this.users);
}

class UsersFailed extends UserDataInitial {}

