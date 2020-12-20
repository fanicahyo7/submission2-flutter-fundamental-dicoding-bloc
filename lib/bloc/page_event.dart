part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToHomePage extends PageEvent {
  final int bottomNavBarIndex;

  GoToHomePage({this.bottomNavBarIndex = 0});

  @override
  List<Object> get props => [bottomNavBarIndex];
}

class GoToDetailRestaurantPage extends PageEvent {
  final String idrestaurant;

  GoToDetailRestaurantPage(this.idrestaurant);

  @override
  List<Object> get props => [idrestaurant];
}
