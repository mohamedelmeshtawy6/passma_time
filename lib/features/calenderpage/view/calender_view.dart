import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:passma_time/features/calenderpage/view/widget/calender_stream.dart';
import 'package:passma_time/features/calenderpage/view/widget/month_choose.dart';
import 'package:passma_time/features/calenderpage/viewmodel/cubit/calender_cubit.dart';

class CalenderView extends StatelessWidget {
   CalenderView({super.key});

    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        MonthChoose( ),
        CalenderStream( )
      ]),
    ));
  }
}
