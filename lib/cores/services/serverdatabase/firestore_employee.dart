import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:intl/intl.dart';
import 'package:passma_time/features/RecordPage/data/model/user_record_model.dart';

import 'package:passma_time/features/auth/data/model/user_model.dart';

 class FirestoreEmployee {
  final  CollectionReference 
  _userCollectionRef =
      FirebaseFirestore.instance.collection('user');

  Future<void> addEmployeeData(EmployeeModel employeeModel) async {
     await _userCollectionRef
        .doc(employeeModel.id)
        .set(employeeModel.toJson());
  }

  Future<DocumentSnapshot> getEmployee(String id) async {
    return await _userCollectionRef.doc(id).get();
  }

  Future<UserRecordModel> addEmployeeCheckData(List <Placemark>place,String id) async {
    UserRecordModel userRecordModel;

    var doc = await _userCollectionRef
        .doc(id)
        .collection('record')
        .doc(DateFormat('dd MMMM yyyy').format(DateTime.now().toUtc().add(const Duration(hours: 2))))
        .get();
    if (doc.exists) {
      String? checkedout = doc.data()!['checkout'];
      if (!checkedout!.contains('.../...')) {
        return UserRecordModel.fromJson(doc.data()!);
      }
    
      userRecordModel = UserRecordModel(
          userCheckin: doc['checkin'],
          userCheckout: DateFormat('hh mm a').format(DateTime.now().toUtc().add(const Duration(hours: 2))),
          date: Timestamp.now(),
          locationCheckin: doc['locationcheckin'],
          locationCheckout:place[0].locality 
          );

      await FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .collection('record')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now().toUtc().add(const Duration(hours: 2))))
          .update(userRecordModel.toJson());

      return userRecordModel;
    } else {
      userRecordModel = UserRecordModel(
          userCheckin: DateFormat('hh mm a').format(DateTime.now().toUtc().add(const Duration(hours: 2))),
          userCheckout: '.../...',
          date: Timestamp.now(),
            locationCheckin:place[0].locality 
            
          );

      await FirebaseFirestore.instance
          .collection('user')
          .doc(id)
          .collection('record')
          .doc(DateFormat('dd MMMM yyyy').format(DateTime.now().toUtc().add(const Duration(hours: 2))))
          .set(userRecordModel.toJson());
      return userRecordModel;
    }
  }

  Future<UserRecordModel?> getEmployeeCheckDataToday(String id) async {
    var doc = await FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('record')
        .doc(DateFormat('dd MMMM yyyy').format(DateTime.now().toUtc().add(Duration(hours: 2))))
        .get();
    if (doc.exists) {
      return UserRecordModel.fromJson(doc.data()!);
    }

    return null;
  }
}


