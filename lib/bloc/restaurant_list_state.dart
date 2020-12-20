part of 'restaurant_list_bloc.dart';

abstract class RestaurantListState extends Equatable {
  const RestaurantListState();
}

class RestaurantListInitial extends RestaurantListState {
  @override
  List<Object> get props => [];
}

class RestaurantListLoaded extends RestaurantListState{
  final List<Restaurants> restolist;

  RestaurantListLoaded({this.restolist});

  @override
  List<Object> get props => [restolist];
}


