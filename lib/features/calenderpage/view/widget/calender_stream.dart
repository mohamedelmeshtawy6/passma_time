import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/features/calenderpage/view/calender_view.dart';
import 'package:passma_time/features/calenderpage/viewmodel/cubit/calender_cubit.dart';

class  CalenderStream extends StatelessWidget {
   CalenderStream({super.key,});
  
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CalenderCubit,CalenderState>(
        builder:(context,state){
        if(state is Monthchanged)
        {
        return  StreamBuilder<QuerySnapshot>(
                      stream: BlocProvider.of<CalenderCubit>(context).lisenToChange(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var data = snapshot.data!.docs;
                          return ListView.builder(
                            shrinkWrap: false,
                            physics: const ScrollPhysics(),
                            itemCount: data.length,
                            itemBuilder: (context, index) {
         return DateFormat('MMMM').format(data[index]['date'].toDate())==state.month?
          SizedBox(
         height: 100,
         child: Card(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(20)),
           child: Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Container(
                   height: double.infinity,
                   decoration: BoxDecoration(
                       color: Colors.red,
                       borderRadius: BorderRadius.circular(20)),
                   width: 100,
                   child: Center(
                       child: Text(DateFormat('EE dd')
                           .format(data[index]['date'].toDate()))),
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('CheckIn',
                         style: AppTextStyles.textStyle16
                             .copyWith(color: Colors.green)),
                     Text(data[index]['checkin'],
                         style: AppTextStyles.textStyle16
                             .copyWith(color: Colors.black))
                   ],
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text('CheckOut',
                         style: AppTextStyles.textStyle16
                             .copyWith(color: Colors.red)),
                     Text(data[index]['checkout'],
                         style: AppTextStyles.textStyle16
                             .copyWith(color: Colors.black))
                   ],
                 )
               ]),
         ),
                            ):const SizedBox();
                          }  );
                        }
                        return const SizedBox();
                      });    
        }
                   return  StreamBuilder<QuerySnapshot>(
                                 stream: BlocProvider.of<CalenderCubit>(context).lisenToChange(),
                                 builder: (context, snapshot) {
                                   if (snapshot.hasData) {
                                     var data = snapshot.data!.docs;
                                     return ListView.builder(
                                       shrinkWrap: false,
                                       physics: const NeverScrollableScrollPhysics(),
                                       itemCount: data.length,
                                       itemBuilder: (context, index) {
                    return DateFormat('MMMM').format(data[index]['date'].toDate())==state.month?
                     SizedBox(
                    height: 100,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 100,
                              child: Center(
                                  child: Text(DateFormat('EE dd')
                                      .format(data[index]['date'].toDate()))),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CheckIn',
                                    style: AppTextStyles.textStyle16
                                        .copyWith(color: Colors.green)),
                                Text(data[index]['checkin'],
                                    style: AppTextStyles.textStyle16
                                        .copyWith(color: Colors.black))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('CheckOut',
                                    style: AppTextStyles.textStyle16
                                        .copyWith(color: Colors.red)),
                                Text(data[index]['checkout'],
                                    style: AppTextStyles.textStyle16
                                        .copyWith(color: Colors.black))
                              ],
                            )
                          ]),
                    ),
                                       ):const SizedBox();
                                     }  );
                                   }
                                   return const SizedBox();
                                 });    
        }),
    );
  }
}