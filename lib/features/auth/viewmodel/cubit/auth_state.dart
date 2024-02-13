part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class Authloading extends AuthState {}
final class AuthSingUpSuccess extends AuthState {}
final class AuthSingUpfail extends AuthState {}
final class AuthLoginSuccess extends AuthState {}
final class AuthLoginFial extends AuthState {}
final class LoginGoogleSuccess extends AuthState {}



