import 'dart:math' as math;

import 'package:burger_app/bloc/bottom_navgation/bottom_navigation.dart';
import 'package:burger_app/common/util/color_utils.dart';
import 'package:burger_app/common/widget/bottom_navigation_widget.dart';
import 'package:burger_app/screens/account_screen.dart';
import 'package:burger_app/screens/cart_screen.dart';
import 'package:burger_app/screens/favourite_screen.dart';
import 'package:burger_app/screens/home_screen.dart';
import 'package:burger_app/screens/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  bool initial;
  MainPage({this.initial = true});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  String qrCode = 'UnKnown';
  late DateTime currentBackPressTime;
  BottomNavigationBloc bloc = BottomNavigationBloc();
  late AnimationController _controller;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;

      return Future.value(false);
    }
    return Future.value(true);
  }

  // This Function save all Location Locally and add check user Authentication.
  // Future<void> saveLocationListAndCheckUserToken() async {
  //   searchPageRepository = SearchPageRepository(
  //     env: RepositoryProvider.of<Env>(context),
  //     apiProvider: RepositoryProvider.of<ApiProvider>(context),
  //     internetCheck: RepositoryProvider.of<InternetCheck>(context),
  //     userRepository: RepositoryProvider.of<UserRepository>(context),
  //   );
  //   profileRepository = ProfileRepository(
  //     env: RepositoryProvider.of<Env>(context),
  //     apiProvider: RepositoryProvider.of<ApiProvider>(context),
  //     internetCheck: RepositoryProvider.of<InternetCheck>(context),
  //     userRepository: RepositoryProvider.of<UserRepository>(context),
  //   );
  //   DataResponse response =
  //       await searchPageRepository.locationListSavedLocally();
  //   if (response.status == Status.UnAuthorised) {
  //     profileRepository.logOut();
  //   }
  // }

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => bloc..add(AppStarted()),
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onWillPop,
          child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              if (state is PageLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CurrentIndexChanged) {
                print(state);
                switch (state.currentIndex) {
                  case 0:
                    return HomeScreen();
                  case 1:
                    return FavouriteScreen();
                  case 2:
                    return AccountScreen();
                  case 3:
                    return MoreScreen();
                }
                return Container();
              }

              return Container();
            },
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar:
            BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
                builder: (BuildContext context, BottomNavigationState state) {
          return FABBottomAppBar(
            centerItemText: "fkdjfkl",
            color: ConstantColor.white,
            selectedColor: ConstantColor.white,
            iconSize: 25.0,
            height: 55.0,
            selectedTextStyle: TextStyle(
              color: ConstantColor.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 14.5,
              height: 1.4,
            ),
            unselectedTextStyle: TextStyle(
              color: ConstantColor.black,
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              height: 1.4,
            ),
            backgroundColor: ConstantColor.primaryColor,
            notchedShape: CircularNotchedRectangle(),
            currentIndex:
                BlocProvider.of<BottomNavigationBloc>(context).currentIndex,
            items: [
              FABBottomAppBarItem(
                // iconData: Icons.home,
                svgImageSelected: Icon(
                  Icons.home,
                  color: ConstantColor.primaryColor,
                ),
                svgImageUnselected: Icon(
                  Icons.home,
                  color: ConstantColor.secondaryColor,
                ),
                text: "Home",
              ),
              FABBottomAppBarItem(
                // iconData: Icons.home,
                svgImageSelected: Icon(
                  Icons.favorite,
                  color: ConstantColor.primaryColor,
                ),
                svgImageUnselected: Icon(
                  Icons.favorite,
                  color: ConstantColor.secondaryColor,
                ),
                text: "Favourites",
              ),
              FABBottomAppBarItem(
                svgImageSelected: Icon(
                  Icons.person,
                  color: ConstantColor.primaryColor,
                ),
                svgImageUnselected: Icon(
                  Icons.person,
                  color: ConstantColor.secondaryColor,
                ),
                text: "Account",
              ),
              FABBottomAppBarItem(
                text: "Settings",
                svgImageSelected: Icon(
                  Icons.settings,
                  color: ConstantColor.secondaryColor,
                ),
                svgImageUnselected: Icon(
                  Icons.settings,
                  color: ConstantColor.secondaryColor,
                ),
              ),
            ],
            onTabSelected: (index) {
              BlocProvider.of<BottomNavigationBloc>(context).add(
                PageTapped(index: index),
              );
            },
          );
        }),
      ),
    );
  }
}
