import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../core/error/exceptions.dart';
import '../core/error/failure.dart';

class AppUtils {
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<bool> hasInternetConnection() async {
    return await InternetConnectionChecker().hasConnection;
  }

  static String buildErrorMsg(Failure failure) {
    log('failure: $failure');
    log('failure.msg: ${failure.msg}');
    if (failure.msg != null) {
      return failure.msg!;
    } else if (failure is NoInternetConnectionFailure) {
      return 'no_internet_connection';
    } else if (failure is InternalServerErrorFailure) {
      return 'internal_server_error';
    } else if (failure is UnauthorizedFailure) {
      return 'not_authorized';
    } else if (failure is NotFoundFailure) {
      return 'not_found';
    } else if (failure is MethodNotAllowedFailure) {
      return 'method_not_allowed';
    } else if (failure is ConnectionTimeoutFailure) {
      return 'connection_timeout';
    } else if (failure is BadRequestFailure) {
      return 'bad_request';
    } else if (failure is MyHttpFailure) {
      return 'http_exception';
    } else if (failure is MyFormatFailure) {
      return 'format_exception';
    } else if (failure is NeedToUpdateBackendFailure) {
      return 'please_contact_our_technical_support_to_upgrade_your_server_side_app';
    } else if (failure is NeedToUpdateApplicationFailure) {
      return 'please_update_your_application';
    } else {
      return 'unknown_error';
    }
  }

  static Failure buildFailure(dynamic e) {
    if (e is NotFoundException) {
      return NotFoundFailure();
    } else if (e is InternalServerErrorException) {
      return InternalServerErrorFailure();
    } else if (e is BadRequestException) {
      return BadRequestFailure()..msg = e.errorMsg;
    } else if (e is UnauthorizedException) {
      return UnauthorizedFailure()..msg = e.errorMsg;
    } else if (e is MethodNotAllowedException) {
      return MethodNotAllowedFailure();
    } else if (e is ConnectionTimeoutException) {
      return ConnectionTimeoutFailure();
    } else if (e is NeedToUpdateBackendException) {
      return NeedToUpdateBackendFailure(
          errorMsg:
              'please_contact_our_technical_support_to_upgrade_your_server_side_app');
    } else if (e is NeedToUpdateApplicationException) {
      return NeedToUpdateApplicationFailure(
          errorMsg: 'please_update_your_application');
    } else {
      return UnknownFailure();
    }
  }



  static showToast({required String msg, Color? bgColor, Toast? toastLength}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      backgroundColor: bgColor ?? Colors.red,
      textColor: Colors.white,
      fontSize: 14.0.sp,
    );
  }
}

class ErrorResponse {
  String errorMessage;

  ErrorResponse({required this.errorMessage});

  Map<String, dynamic> toMap() {
    return {
      'errorMessage': errorMessage,
    };
  }

  factory ErrorResponse.fromMap(Map<String, dynamic> map) {
    return ErrorResponse(
      errorMessage: map['ErrorMessage'] as String,
    );
  }
}
