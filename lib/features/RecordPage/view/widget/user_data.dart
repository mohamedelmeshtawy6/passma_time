import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passma_time/features/RecordPage/viewmodel/cubit/record_cubit.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                      style: Theme.of(context).textTheme.displaySmall,
                      BlocProvider.of<RecordCubit>(context)
                          .getuserdata()
                          .name
                          .toString()),
                ],
              ),
              Center(
                  child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(BlocProvider.of<RecordCubit>(context)
                    .getuserdata()
                    .picture
                    .toString()),
              )),
            ],
          );
  }
}