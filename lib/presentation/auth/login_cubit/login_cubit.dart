import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/shared_preference_class.dart';


part 'login_state.dart';


class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  late String verify;
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context)=> BlocProvider.of(context);


  Future<void> signIn(String email, String password) async {
    try {
      emit(LoginStateLoading());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      sharedPrefs.setPhone(email);
      emit(LoginStateLoaded(FirebaseAuth.instance.currentUser!));
    } catch (e) {
      // Handle the error
      emit(LoginStateFailed());
    }
  }
  Future<void> signInWithGoogle() async {
    try {
      emit(GoogleLoginLoading());
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User user = authResult.user!;
      emit(GoogleLoginLoaded(user));
    } catch (error) {
      emit(GoogleLoginFailed());
    }
  }


  Future<void> signInWithFacebook() async {
    try {
      emit(FacebookLoginLoading());
      final fb = FacebookLogin();
      final  result = await fb.logIn(permissions: [
        FacebookPermission.email,
        FacebookPermission.publicProfile,
      ]);

          if(result.status==FacebookLoginStatus.success){
            final AuthCredential credential =
            FacebookAuthProvider.credential(result.accessToken!.token);
            final UserCredential authResult =
            await _auth.signInWithCredential(credential);
            final User user = authResult.user!;
            emit(FacebookLoginLoaded(user));
          }else if(result.status==FacebookLoginStatus.cancel){
            emit(FacebookLoginFailed());
          }else if(result.status==FacebookLoginStatus.error) {
            emit(FacebookLoginFailed());
          }
    } catch (error) {
      emit(FacebookLoginFailed());
    }
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    try {
      emit(RegisterLoading());
      await _auth.verifyPhoneNumber(
          phoneNumber: '+2${phoneNumber}',
        timeout: const Duration(seconds: 14),
          verificationCompleted: verificationCompleted,
    verificationFailed: (FirebaseAuthException e) {
            print('exception:$e');
    emit(RegisterFailed());
    },

        codeSent: codeSent,
        codeAutoRetrievalTimeout: (String verificationId) {
        }
      );
    } catch (e) {
      emit(RegisterFailed());
    }
  }

  void verificationCompleted(PhoneAuthCredential credential) async{
    print('verification completed');
    await signInWithPhone(credential);

  }

  void codeSent(String verificationId, int? resendToken){

    print('code sent');
    verify = verificationId;

  }

  void codeAutoRetrievalTimeout(String verificationId){
    print('codeAutoRetrievalTimeout');
  }

  Future<void> submitOtp(String otpCode) async{

    PhoneAuthCredential credential =
    PhoneAuthProvider.credential(verificationId: verify, smsCode: otpCode);
    await signInWithPhone(credential);
  }
  Future<void> signInWithPhone(PhoneAuthCredential credential) async{
    try{

      await _auth.signInWithCredential(credential);
      //emit(RegisterLoaded());
    }catch(error){
      print('error$error');
      emit(RegisterFailed());
    }

  }

  Future<void> logOut() async{
    await _auth.signOut();
  }

  User getLoggedInUser(){
    return _auth.currentUser!;

  }

  Future<void> verifyCode(String controller) async{
    print('verify method');

    try{
      emit(VerifyCodeLoading());

      String smsCode = controller;


      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential =
      PhoneAuthProvider.credential(verificationId: verify, smsCode: smsCode);

      // Sign the user in (or link) with the credential
      await _auth.signInWithCredential(credential);
      emit(VerifyCodeLoaded());
    }catch(error){
      emit(VerifyCodeFailed());
    }

  }
  Future<void> registerWithEmailAndPassword(String email, String password) async {
    try {
      emit(RegisterLoading());
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      sharedPrefs.setPhone(email);
      emit(RegisterLoaded(userCredential.user!));
    } catch (e) {
      emit(RegisterFailed());
    }
  }
}
