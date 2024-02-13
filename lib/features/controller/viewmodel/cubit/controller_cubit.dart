import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:passma_time/cores/services/local_database/shared_prefrence_storage.dart';

part 'controller_state.dart';

class ControllerCubit extends Cubit<ControllerState> {
  ControllerCubit() : super(ControllerInitial());



 
  checkUser(){
if ( SharedPrefrenceEmployee.sharedSingleTone.fetchUser()== null)
   {
 emit(NoUser());
   }
else{ emit(YesUser());}
  }






}
