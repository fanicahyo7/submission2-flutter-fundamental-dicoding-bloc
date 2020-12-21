import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/services/restaurant_list_services.dart';

part 'restaurant_detail_event.dart';
part 'restaurant_detail_state.dart';

class RestaurantDetailBloc
    extends Bloc<RestaurantDetailEvent, RestaurantDetailState> {
  @override
  Stream<RestaurantDetailState> mapEventToState(
    RestaurantDetailEvent event,
  ) async* {
    if (event is FetchDetailRestaurant) {
      List<Restaurant> resto =
          await RestaurantListServices.ambilDetailResto(event.id);

      yield RestaurantDetailLoaded(resto);
    }
  }

  @override
  RestaurantDetailState get initialState => throw RestaurantDetailLoaded([]);
}
