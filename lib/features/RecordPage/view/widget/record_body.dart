import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/features/RecordPage/view/widget/check_in_out.dart';
import 'package:passma_time/features/RecordPage/view/widget/data_time.dart';
import 'package:passma_time/features/RecordPage/view/widget/slide_to_act.dart';
import 'package:passma_time/features/RecordPage/view/widget/user_data.dart';
import 'package:passma_time/features/RecordPage/viewmodel/cubit/record_cubit.dart';
import 'package:slide_to_act/slide_to_act.dart';

class RecordBody extends StatelessWidget {
  const RecordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.only(right: 15, top: 50, left: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            UserData(),
           SizedBox(
            height: 50,
          ),
  CheckInOut(),
           SizedBox(
            height: 50,
          ),
        DateTimeWidget(),
           SizedBox(
            height: 50,
          ),
SlideToActWidget()
        ],
      ),
    );
  }
}