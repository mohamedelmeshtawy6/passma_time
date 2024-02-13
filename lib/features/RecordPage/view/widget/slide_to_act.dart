import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/constant/app_textstyles.dart';
import 'package:passma_time/features/RecordPage/viewmodel/cubit/record_cubit.dart';
import 'package:slide_to_act/slide_to_act.dart';

class SlideToActWidget extends StatelessWidget {
  const SlideToActWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
            padding: const EdgeInsets.all(15),
            child: BlocBuilder<RecordCubit, RecordState>(
                builder: (context, state) {
              if (state is RecordSucces) {
                if (state.userRecordModel.userCheckout == '.../...') {
                  return Builder(builder: (context) {
                    GlobalKey<SlideActionState> key = GlobalKey();

                    return SlideAction(
                      sliderRotate: true,
                      key: key,
                      onSubmit: () async {
                        Position? position =
                            await context.read<RecordCubit>().getlocation();
                        if (position != null) {
                          List<Placemark> place =
                              await placemarkFromCoordinates(
                                  position.latitude, position.longitude);
                          await BlocProvider.of<RecordCubit>(context)
                              .insetRecord(place);
                          key.currentState!.reset();
                          return null;
                        }
                        return null;
                      },
                      alignment: Alignment.center,
                      innerColor: AppColors.kredprimary1,
                      outerColor: Colors.white,
                      child: Text(
                        'Swap to checkout',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColors.kredprimary1),
                      ),
                    );
                  });
                }

                return Center(
                    child: Text(
                  'Thank you for Coming Today',
                  style: AppTextStyles.textStyle18
                      .copyWith(color: Colors.blueAccent),
                ));
              }

              return Builder(builder: (context) {
                GlobalKey<SlideActionState> key = GlobalKey();

                return SlideAction(
                  sliderRotate: true,
                  key: key,
                  onSubmit: () async {
                    Position? position =
                        await context.read<RecordCubit>().getlocation();
                    if (position != null) {
                      List<Placemark> place = await placemarkFromCoordinates(
                          position.latitude, position.longitude);
                      await BlocProvider.of<RecordCubit>(context)
                          .insetRecord(place);
                      key.currentState!.reset();
                      return null;
                    }
                    return null;
                  },
                  alignment: Alignment.center,
                  innerColor: AppColors.kgreenprimary,
                  outerColor: Colors.white,
                  child: Text(
                    'Swap to CheckIn',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: AppColors.kgreenprimary),
                  ),
                );
              });
            }),
          );
  }
}