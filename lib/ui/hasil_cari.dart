import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/restaurant_search_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/models/restaurant_search.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/widgets/card_searh.dart';

class HasilCariPage extends StatefulWidget {
  final String parameter;

  HasilCariPage({this.parameter = ""});
  @override
  _HasilCariPageState createState() => _HasilCariPageState();
}

class _HasilCariPageState extends State<HasilCariPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToHomePage());
        return;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.amber,
            ),
            SafeArea(
                child: Container(
              color: Colors.white,
            )),
            SafeArea(
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin:
                              EdgeInsets.only(left: 16, top: 16, bottom: 16),
                          child: Text(
                            'Hasil Cari',
                            style: font1.copyWith(fontSize: 20),
                          ),
                        ),
                      ),
                      BlocProvider(
                        create: (_) => RestaurantSearchBloc()
                          ..add(SearchRestauranton(widget.parameter)),
                        child: BlocBuilder<RestaurantSearchBloc,
                                RestaurantSearchState>(
                            builder: (_, restoListState) {
                          print(widget.parameter);
                          print(restoListState.toString());
                          if (restoListState is RestaurantSearchLoaded) {
                            List<Restaurantss> restoList =
                                restoListState.restaurant;
                            return Column(
                              children: restoList
                                  .map((e) => CardRestoSearch(
                                        e,
                                        restoList,
                                        onTap: () {
                                          context.read<PageBloc>().add(
                                              GoToDetailRestaurantPage(e.id));
                                        },
                                      ))
                                  .toList(),
                            );
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                      ),
                      SizedBox(
                        height: 16,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
