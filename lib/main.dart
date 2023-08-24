import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doctor/ViewModel/bloc/SignUp/signcubit.dart';
import 'package:doctor/ViewModel/bloc/admin/admincubit.dart';
import 'package:doctor/ViewModel/bloc/doctor/doccubit.dart';
import 'package:doctor/ViewModel/bloc/home/homecubit.dart';
import 'package:doctor/ViewModel/bloc/loccal/sharedpref/shared.dart';
import 'View/auth/signin.dart';
import 'View/screens/homescreen.dart';
import 'ViewModel/bloc/Login/logcubit.dart';
import 'ViewModel/bloc/blocobserver/observer.dart';
import 'ViewModel/bloc/loccal/sharedpref/sharedkeys.dart';
import 'ViewModel/services/network/diohelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.initState();
  await SharedPreference.initShared();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LogCubit()..Login()),
          BlocProvider(create: (context) => SignCubit()..register()),
          BlocProvider(
              create: (context) => Doccubit()
                ..AddPatient()
                ..Update()
                ..Delete()),
          BlocProvider(
              create: (context) => AdminCubit()
                ..AddDoctor()
                ..Update()
                ..Delete()),
          BlocProvider(create: (context) => HomeCubit()),
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (BuildContext context, Widget? child) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: 
                (SharedPreference.get(SharedKeys.IsLogin)??false)?HomeScreen():SignIn(),
                );
          },
        ));
  }
}
