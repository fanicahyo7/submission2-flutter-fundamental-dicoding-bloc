import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_detail_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/shared_value.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_detail.dart';

class DetailRestaurantPage extends StatefulWidget {
  final String idrestaurant;

  DetailRestaurantPage(this.idrestaurant);
  @override
  _DetailRestaurantPageState createState() => _DetailRestaurantPageState();
}

class _DetailRestaurantPageState extends State<DetailRestaurantPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => RestaurantDetailBloc()
          ..add(FetchDetailRestaurant(widget.idrestaurant)),
        child: BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
            builder: (_, detailList) {
              print(widget.idrestaurant);
          if (detailList is RestaurantDetailLoaded) {
            return Column(
              children: [
                Text(detailList.restaurant.name),
                Text(detailList.restaurant.description),
                Column(
                  children: detailList.restaurant.menus.drinks
                      .map((e) => Text(e.name))
                      .toList(),
                )
              ],
            );
          } else {
            return CircularProgressIndicator();
          }
        }),
      ),
    );
  }
}

Widget _detail(Restaurant resto) {
  return Stack(
    children: [
      Hero(
        tag: resto.pictureId,
        child: Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: (resto.pictureId != null)
                      ? NetworkImage(
                          baseURL + 'images/medium/' + resto.pictureId)
                      : AssetImage('assets/no-image.png'),
                  fit: BoxFit.cover)),
        ),
      ),
    ],
  );
}
