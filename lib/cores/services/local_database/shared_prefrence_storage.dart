import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding_platform_interface/src/models/placemark.dart';
import 'package:passma_time/cores/constant/apptext.dart';
import 'package:passma_time/cores/services/serverdatabase/firestore_employee.dart';
import 'package:passma_time/cores/shared/functions/fluttertoast.dart';
import 'package:passma_time/features/RecordPage/data/model/user_record_model.dart';
import 'package:passma_time/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceEmployee {
  SharedPrefrenceEmployee._();

  static SharedPrefrenceEmployee sharedSingleTone = SharedPrefrenceEmployee._();
   late SharedPreferences _sharedPreferences;

  Future<void> initialshared() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<bool> setUser(EmployeeModel model) async {
  bool isset=await  _sharedPreferences.setString(AppText.userdata, json.encode(model.toJson()));
return isset;
}

  EmployeeModel? fetchUser() {
    try {
      String? value = _sharedPreferences.getString(AppText.userdata);
      if (value == null) {
        return null;
      }
      return EmployeeModel.fromJson(json.decode(value));
    } catch (e) {
      showMessage('error message :$e');
      return null;
    }
  }

  deletUser() async {
    await _sharedPreferences.clear();
  }
}


  
