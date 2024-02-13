import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/features/RecordPage/viewmodel/cubit/record_cubit.dart';

class CheckInOut extends StatelessWidget {
  const CheckInOut({super.key});

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CheckIn',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.green)),
                        BlocBuilder<RecordCubit, RecordState>(
                            builder: (context, state) {
                          if (state is RecordSucces) {
                            return Text(state.userRecordModel.userCheckin!,
                                style: AppTextStyles.textStyle16
                                    .copyWith(color: Colors.black));
                          } else if (state is RecordFaile) {
                            return Text(state.error,
                                style: AppTextStyles.textStyle16
                                    .copyWith(color: Colors.black));
                          }
                          return Text('.../...',
                              style: AppTextStyles.textStyle16
                                  .copyWith(color: Colors.black));
                        }),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: SizedBox(
                    width: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('CheckOut',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(color: Colors.red)),
                        BlocBuilder<RecordCubit, RecordState>(
                            builder: (context, state) {
                          if (state is RecordSucces) {
                            return Text(state.userRecordModel.userCheckout!,
                                style: AppTextStyles.textStyle16
                                    .copyWith(color: Colors.black));
                          } else if (state is RecordFaile) {
                            return Text(state.error,
                                style: AppTextStyles.textStyle16
                                    .copyWith(color: Colors.black));
                          }
                          return Text('.../...',
                              style: AppTextStyles.textStyle16
                                  .copyWith(color: Colors.black));
                        }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}