import 'dart:async';

import 'package:bloc/bloc.dart';

import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  BottomNavigationBloc() : super(PageLoading());

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(
      BottomNavigationEvent event) async* {
    if (event is AppStarted) {
      add(PageTapped(index: currentIndex));
    }
    if (event is SearchButtonPressed) {}
    if (event is PageTapped) {
      currentIndex = event.index;
      yield CurrentIndexChanged(currentIndex: this.currentIndex);
    }
  }
}
