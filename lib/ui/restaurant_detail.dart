import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_detail_bloc.dart';
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
        body: Stack(children: [
      Container(
        color: Colors.amber,
      ),
      SafeArea(
          child: Container(
        color: Colors.white,
      )),
      SafeArea(child: SingleChildScrollView(child:
          BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
              builder: (_, detailList) {
        if (detailList is RestaurantDetailLoaded) {
          List<Restaurant> restoDetail = detailList.restaurant.take(1);
          return Stack(children: [
            Hero(
                  tag: restoDetail,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(restoDetail.toString()),
                            fit: BoxFit.cover)),
                  ),
                ),
          ],);
        } else {
          return CircularProgressIndicator();
        }
      })))
    ]));
  }
}
