import 'package:flutter/material.dart';

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
      Column(
        children: [Text(widget.idrestaurant)],
      )
    ]));
  }
}
