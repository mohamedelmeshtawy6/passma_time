 import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
 

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
       print(change);

  }

  @override
  void onTransition(Bloc bloc, Transition transition) {

    super.onTransition(bloc, transition);

  }
}