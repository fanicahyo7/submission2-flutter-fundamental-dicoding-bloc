import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_search_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/card_searh.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController _parameterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToHomePage());
        return;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search Restaurant'),
        ),
        body: ListView(
          children: [
            Row(
              children: [
                Container(
                    width: 100,
                    child: TextField(
                      controller: _parameterController,
                    )),
                Container(
                    width: 56,
                    child: RaisedButton(onPressed: () {
                      setState(() {
                        RestaurantSearchBloc()
                          ..add(SearchRestauranton(_parameterController.text));
                      });
                    }))
              ],
            ),
            BlocProvider(
              create: (_) => RestaurantSearchBloc()
                ..add(SearchRestauranton(_parameterController.text)),
              child: BlocBuilder<RestaurantSearchBloc, RestaurantSearchState>(
                builder: (_, searchList) {
                  if (searchList is RestaurantSearchLoaded) {
                    print(searchList.toString());
                    List<Restaurantss> restoList = searchList.restaurant;
                    return Column(
                      children: restoList
                          .map((e) => CardRestoSearch(
                                e,
                                restoList,
                                onTap: () {
                                  context
                                      .read<PageBloc>()
                                      .add(GoToDetailRestaurantPage(e.id));
                                },
                              ))
                          .toList(),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
