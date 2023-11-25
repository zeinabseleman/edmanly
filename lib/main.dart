import 'package:edmanly/presentation/auth/login_cubit/login_cubit.dart';
import 'package:edmanly/presentation/auth/user_data/user_data_cubit.dart';
import 'package:edmanly/presentation/home/home_screen.dart';
import 'package:edmanly/presentation/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'constants/app_theme.dart';
import 'core/shared_preference_class.dart';
import 'domain/language/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefs().init();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp

  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
            create: (context) =>
            LoginCubit()),
        BlocProvider<UserDataCubit>(
            create: (context) =>
                UserDataCubit()),
    ],
      child: ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (_, child) {
            return MaterialApp(
              locale: Locale(sharedPrefs.getLanguage()),
              supportedLocales: const [
                Locale('en', 'US'),
                Locale('ar', ''),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              title: 'Edmanly',
              theme: AppTheme.lightTheme,
              home: Directionality(
                textDirection: sharedPrefs.getLanguage() == "ar"
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: const SplashScreen(),
              ),
            );
          }),
    );
  }
}
