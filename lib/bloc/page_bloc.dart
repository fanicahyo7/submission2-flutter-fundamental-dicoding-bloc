import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'page_event.dart';
part 'page_state.dart';

class PageBloc extends Bloc<PageEvent, PageState> {
  @override
  PageState get initialState => PageInitial();

  @override
  Stream<PageState> mapEventToState(
    PageEvent event,
  ) async* {
    if (event is GoToSplashPage) {
      yield OnSplashPage();
    } else if (event is GoToHomePage) {
      print(event.toString());
      yield OnHomePage(bottomNavBarIndex: event.bottomNavBarIndex);
    } else if (event is GoToDetailRestaurantPage) {
      print(event.toString());
      yield OnDetailRestaurantPage(event.idrestaurant);
    }
  }
}
