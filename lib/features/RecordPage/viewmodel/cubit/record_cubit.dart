import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:passma_time/cores/services/local_database/shared_prefrence_storage.dart';
import 'package:passma_time/cores/shared/functions/fluttertoast.dart';
import 'package:passma_time/features/RecordPage/data/model/user_record_model.dart';
import 'package:passma_time/features/RecordPage/data/repo/record_page_repo.dart';
import 'package:passma_time/features/auth/data/model/user_model.dart';

part 'record_state.dart';

class RecordCubit extends Cubit<RecordState> {
  RecordCubit(this.recordPageRepo) : super(RecordInitial());
final RecordPageRepo recordPageRepo;


EmployeeModel getuserdata(){
  var user= SharedPrefrenceEmployee.sharedSingleTone.fetchUser();
 return user!;

 }












Future <dynamic> ?insetRecord(List <Placemark>plac) async{

var data= await recordPageRepo.doRecord(plac,getuserdata().id);
   data.fold((l) {
      emit(RecordFaile(error: l.errMessage));
    }, (r) {
      emit(RecordSucces(userRecordModel: r));
    });

}


Future<void> getrecord()async{

 var data=await  recordPageRepo.getRecord(getuserdata().id);

data.fold((l) {
  emit(RecordFaile(error: l.errMessage));
}, (r) {

if(r!=null) {

   emit(RecordSucces(userRecordModel: r));
  
 
}

});

}





 Future <Position?>  getlocation()async{

bool service;
    service=await Geolocator.isLocationServiceEnabled();

if(!service){
showMessage('open GPS');
return null;
}
 LocationPermission permission=await  Geolocator.checkPermission();
    
if(permission==LocationPermission.denied){
permission  =await     Geolocator.requestPermission();
if(permission==LocationPermission.denied) {
  showMessage('we need you location to check ');
  return null;
}
}
if(permission==LocationPermission.deniedForever){
showMessage('you must get location enabled');
return null;
}
if(permission==LocationPermission.whileInUse){
 Position position=await    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
 
return position;
}







}













 }






