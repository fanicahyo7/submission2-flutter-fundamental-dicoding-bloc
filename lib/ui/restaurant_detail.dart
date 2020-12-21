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
      body: 
      BlocProvider(
        create: (_) => RestaurantDetailBloc()
          ..add(FetchDetailRestaurant(widget.idrestaurant)),
        child: BlocBuilder<RestaurantDetailBloc, RestaurantDetailState>(
            builder: (_, detailList) {
          if (detailList is RestaurantDetailLoaded) {
            // print(detailList.toString());
            // List<Restaurant> restoDetail = detailList.restaurant.sublist(0, 1);

            // return ListView.builder(
            //   scrollDirection: Axis.horizontal,
            //   itemCount: restoDetail.length,
            //   itemBuilder: (context, index) => Container(
            //     height: 100,
            //     child: Text(restoDetail[index].name),
            //   ),
            // );

            return Container(
              child: Text('Halo'),
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
