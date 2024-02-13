import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:passma_time/features/auth/view/login_view.dart';
import 'package:passma_time/features/auth/view/signup_view.dart';
import 'package:passma_time/features/controller/view/controller_view.dart';
import 'package:passma_time/features/controller/viewmodel/cubit/controller_cubit.dart';

abstract class AppRouter {
  static const authlogin = '/login';
  static const authsignup = '/signup';
  static const controllerview = '/';

  static final route = GoRouter(routes: [
    GoRoute(
      path: "/",
      builder: (context, state) {
        return BlocProvider(
          create: (context) => ControllerCubit()..checkUser(),
          child: ControllerView(),
        );
      },
    ),
    GoRoute(
      path: "/login",
      builder: (context, state) {
        return LoginView();
      },
    ),
    GoRoute(
      path: "/signup",
      builder: (context, state) {
        return SignupView();
      },
    ),
  ]);
}
