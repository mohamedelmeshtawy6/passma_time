import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:passma_time/features/calenderpage/data/repo/calender_repo.dart';

import '../../../../cores/services/local_database/shared_prefrence_storage.dart';

part 'calender_state.dart';

class CalenderCubit extends Cubit<CalenderState> {
  CalenderCubit(this.calenderrepo) : super(CalenderInitial());
 final CalenderRepo calenderrepo;
 var id = SharedPrefrenceEmployee.sharedSingleTone.fetchUser()!.id;
 


  getMonth(BuildContext context)async{


  DateTime? monthPicked =await showMonthYearPicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2024),
                      lastDate: DateTime(2050));
                      if(monthPicked!=null){

                   
                    String  month=DateFormat('MMMM').format(monthPicked);

            emit(Monthchanged(month));
           
  }

}



Stream<QuerySnapshot>? lisenToChange(){

return calenderrepo.lisenchange(id);


}
}

