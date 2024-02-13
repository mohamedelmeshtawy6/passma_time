import 'package:dartz/dartz.dart';
import 'package:geocoding/geocoding.dart';
import 'package:passma_time/cores/errors/failure.dart';
import 'package:passma_time/features/RecordPage/data/model/user_record_model.dart';

abstract class RecordPageRepo{


Future <Either<Failure,UserRecordModel>> doRecord (List <Placemark>place,String id);
Future <Either<Failure,UserRecordModel?>> getRecord (String id);










}