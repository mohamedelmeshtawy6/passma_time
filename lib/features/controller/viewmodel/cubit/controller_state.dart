part of 'controller_cubit.dart';

@immutable
sealed class ControllerState {}

final class ControllerInitial extends ControllerState {}
final class NoUser extends ControllerState {}
final class YesUser extends ControllerState {}
 
 




