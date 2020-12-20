import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_list_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_list.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/card_resto.dart';

class ResturantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 16, top: 16),
                child: Text(
                  'Restaurant',
                  style: font1.copyWith(fontSize: 30),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(left: 16, bottom: 6),
                  child: Text(
                    'Recommendation restaurant for you!',
                    style: font2.copyWith(fontSize: 14),
                  )),
              BlocBuilder<RestaurantListBloc, RestaurantListState>(
                  builder: (_, restoListState) {
                if (restoListState is RestaurantListLoaded) {
                  List<Restaurants> restoList = restoListState.restolist;
                  return Column(
                    children:
                        restoList.map((e) => CardResto(
                          e, 
                          restoList, 
                          onTap: () {
                          context
                            .bloc<PageBloc>()
                            .add(GoToDetailRestaurantPage(e.name));
                        },)).toList(),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
              SizedBox(
                height: 70,
              )
            ],
          ),
        ],
      ),
    );
  }
}
