import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/features/calenderpage/viewmodel/cubit/calender_cubit.dart';

class MonthChoose extends StatelessWidget {
  MonthChoose({super.key, });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'MyAttendence',
          style: AppTextStyles.textStyle20.copyWith(color: Colors.green),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<CalenderCubit, CalenderState>(
              builder: (context, state) {
                if(state is Monthchanged) {
                  return Text(state.month, style: AppTextStyles.textStyle16);
                }
                  return Text(state.month, style: AppTextStyles.textStyle16);
                
              },
            ),
            GestureDetector(
                onTap:(){
                    BlocProvider.of<CalenderCubit>(context).getMonth(context);
                  
                },
                child:
                    const Text('pick month', style: AppTextStyles.textStyle16)),
          ],
        ),
      ],
    );
  }
}
