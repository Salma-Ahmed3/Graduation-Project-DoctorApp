import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gbsub/Core/cubits/bottomnavigationbarcubit/MainCubi.dart';
import 'package:gbsub/Core/services/sharedpref.dart';
import 'package:gbsub/Features/Home/Ui/Home_view.dart';
import 'package:gbsub/Features/Login/Ui/login_view.dart';
import 'package:gbsub/Features/YourClinicc/logic/reservation_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedhelper.sharedPreferencesinit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReservationCubit(),
        ),
        BlocProvider(
          create: (context) =>
              MainCubit()..LoggedInfun(state: Sharedhelper.loggedIN),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        minTextAdapt: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider.of<MainCubit>(context).loggedin
              ? const HomeView()
              : const LoginView(),
        ),
      ),
    );
  }
}
