
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRecordModel {
 final String? userCheckin;
 final String ?userCheckout;
 final String ?locationCheckout;
 final String ?locationCheckin;
 final Timestamp ?date;



  UserRecordModel({this.date,  this.userCheckin,this.userCheckout,this.locationCheckin,this.locationCheckout});

 factory UserRecordModel.fromJson(Map<String, dynamic> map) =>UserRecordModel(
    userCheckin: map['checkin'],
     userCheckout: map['checkout'],
     locationCheckin: map['locationcheckin'],
     locationCheckout: map['locationcheckout'],
     date: map['date'],
    );
       
  
  
  toJson() {
    return {
      'checkin': userCheckin,
      'checkout': userCheckout,
      'locationcheckin': locationCheckin,
      'locationcheckout': locationCheckout,
      'date': date,
     
    };
  }
}