import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:passma_time/cores/errors/failure.dart';
import 'package:passma_time/cores/services/serverdatabase/firestore_employee.dart';
import 'package:passma_time/features/RecordPage/data/model/user_record_model.dart';
import 'package:passma_time/features/RecordPage/data/repo/record_page_repo.dart';

class RecordPageRepoImpl implements RecordPageRepo{
 final FirestoreEmployee firestoreUser;
 RecordPageRepoImpl({required this.firestoreUser});

  @override
  Future<Either<Failure, UserRecordModel>> doRecord(List<Placemark>place,String id)async {
  
  try{
    
    return right(await firestoreUser.addEmployeeCheckData(place,id));
     

  }catch(e){

  return left(ServerFailure( e.toString()));

  }

  }
  
  @override
  Future<Either<Failure, UserRecordModel?>> getRecord(String id) async{
    try{
    
    return right(await firestoreUser.getEmployeeCheckDataToday(id));
     

  }catch(e){

  return left(ServerFailure( e.toString()));

  }
  }

   
  }










