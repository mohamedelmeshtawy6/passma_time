import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_router.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/cores/services/helper/bloc_observer.dart';
import 'package:passma_time/cores/services/local_database/shared_prefrence_storage.dart';
import 'package:passma_time/features/auth/viewmodel/cubit/auth_cubit.dart';
import 'package:passma_time/firebase_options.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
await SharedPrefrenceEmployee.sharedSingleTone.initialshared();
Bloc.observer= MyBlocObserver();


  runApp(const PassmaTimeConfig());
}

 class PassmaTimeConfig extends StatelessWidget {
  const PassmaTimeConfig({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.route,
      title: 'Flutter Demo',
      theme: ThemeData(
       
      scaffoldBackgroundColor:AppColors.kblackback ,
      textTheme: const TextTheme(displayLarge: AppTextStyles.textStyle20,displayMedium:AppTextStyles.textStyle18,displaySmall: AppTextStyles.textStyle16 )
      ),
    localizationsDelegates: const [
      MonthYearPickerLocalizations.delegate
    ],
    );
  }
}

