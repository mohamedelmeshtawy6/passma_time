import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:passma_time/cores/constant/app_colors.dart';
import 'package:passma_time/cores/services/serverdatabase/firestore_employee.dart';
import 'package:passma_time/features/RecordPage/data/repo/record_page_repo_impl.dart';
import 'package:passma_time/features/RecordPage/view/record_view.dart';
import 'package:passma_time/features/RecordPage/viewmodel/cubit/record_cubit.dart';
import 'package:passma_time/features/auth/view/login_view.dart';
import 'package:passma_time/features/calenderpage/data/repo/calender_repo_impl.dart';
import 'package:passma_time/features/calenderpage/view/calender_view.dart';
import 'package:passma_time/features/calenderpage/viewmodel/cubit/calender_cubit.dart';
import 'package:passma_time/features/controller/viewmodel/cubit/controller_cubit.dart';
import 'package:passma_time/features/profilePage/view/profile_view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class ControllerView extends StatelessWidget {
  ControllerView({super.key});

  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 1);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ControllerCubit, ControllerState>(
        builder: (context, state) {
      if (state is NoUser) {
        return LoginView();
      } else {
        return PersistentTabView(
          context,
          controller: _controller,
          screens: _buildScreens(),
          items: _navBarsItems(context),
          confineInSafeArea: true,
          backgroundColor: AppColors.kwhitetext, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle
              .style6, // Choose the nav bar style with this property.
        );
      }
    });
  }

  List<Widget> _buildScreens() {
    return [
      BlocProvider(
        create: (context) => CalenderCubit(CalenderRepoImpl()),
        child: CalenderView(),
      ),
      BlocProvider(
          create: (context) =>
              RecordCubit(RecordPageRepoImpl(firestoreUser: FirestoreEmployee()))
                ..getrecord(),
          child: const RecordView()),
      const ProfileView()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems(BuildContext context) {
    return [
      PersistentBottomNavBarItem(
        textStyle: Theme.of(context).textTheme.displayMedium,

        icon: const Icon(Icons.calendar_view_day_outlined),
        title: ("calender"),
        activeColorPrimary:  AppColors.kgreenprimary,
        inactiveColorPrimary:AppColors.kblacktext,
      ),
      PersistentBottomNavBarItem(
        textStyle: Theme.of(context).textTheme.displayMedium,
        icon: const Icon(Icons.card_giftcard),
        title: ("record"),
        activeColorPrimary: AppColors.kgreenprimary,
        inactiveColorPrimary: AppColors.kblacktext,
      ),
      PersistentBottomNavBarItem(
        textStyle: Theme.of(context).textTheme.displayMedium,

        icon: const Icon(Icons.person),
        title: ("profile"),
        activeColorPrimary: AppColors.kgreenprimary,
        inactiveColorPrimary: AppColors.kblacktext,
      ),
    ];
  }
}
