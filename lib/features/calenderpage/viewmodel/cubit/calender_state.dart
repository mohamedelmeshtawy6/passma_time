part of 'calender_cubit.dart';

@immutable
sealed class CalenderState {
String  month = DateFormat('MMMM').format(DateTime.now());
  
}

final class CalenderInitial extends CalenderState {
}
final class Monthchanged extends CalenderState {

 final String month;

  Monthchanged(this.month);
}
