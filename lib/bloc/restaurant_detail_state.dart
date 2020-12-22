part of 'restaurant_detail_bloc.dart';

abstract class RestaurantDetailState extends Equatable {
  const RestaurantDetailState();
}

class RestaurantDetailInitial extends RestaurantDetailState {
  @override
  List<Object> get props => [];
}

class RestaurantDetailLoaded extends RestaurantDetailState {
  final Restaurant restaurant;

  RestaurantDetailLoaded(this.restaurant);

  @override
  List<Object> get props => [restaurant];
}
