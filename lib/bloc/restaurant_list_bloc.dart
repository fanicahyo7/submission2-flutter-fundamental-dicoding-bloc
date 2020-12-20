import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/restaurant_list_services.dart';

part 'restaurant_list_event.dart';
part 'restaurant_list_state.dart';

class RestaurantListBloc
    extends Bloc<RestaurantListEvent, RestaurantListState> {
  @override
  Stream<RestaurantListState> mapEventToState(
    RestaurantListEvent event,
  ) async* {
    if (event is FetchRestaurantList) {
      List<Restaurants> restolist =
          await RestaurantListServices.ambilRestoList();
          print(event);
      yield RestaurantListLoaded(restolist: restolist);
    }
  }

  @override
  RestaurantListState get initialState => RestaurantListInitial();
}
