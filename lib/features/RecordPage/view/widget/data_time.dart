import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Date', style: Theme.of(context).textTheme.displayLarge),
              RichText(
                text: TextSpan(
                    text: DateFormat('dd ').format(DateTime.now().toUtc().add(Duration(hours: 2))),
                    style: AppTextStyles.textStyle16
                        .copyWith(color: AppColors.kredprimary1),
                    children: [
                      TextSpan(
                          text: DateFormat('MMMM yyyy ').format(DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(color: Colors.blueAccent))
                    ]),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('Time Now   ',
                style: Theme.of(context).textTheme.displayLarge),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: StreamBuilder<Object>(
                stream: Stream.periodic(const Duration(seconds: 1),
                    (count) => Duration(seconds: count)),
                builder: (context, snapshot) {
                  return Text(DateFormat('hh:mm:ss a ').format(DateTime.now().toUtc().add(Duration(hours:2))),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(color: Colors.blueAccent));
                }),
          ),
    ],);
  }
}