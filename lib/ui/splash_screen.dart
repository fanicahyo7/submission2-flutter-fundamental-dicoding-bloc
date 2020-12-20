import 'package:flutter/material.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/bloc/page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:submission2_flutter_fundamental_dicoding_bloc/common/style.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                context.bloc<PageBloc>().add(GoToHomePage());
              },
              child: Image.asset(
                "assets/resto.png",
                width: 200,
                height: 100,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              child: Text(
                "Selamat Datang di Restaurant",
                style: font1.copyWith(fontSize: 20),
              ),
            ),
            Container(
              height: 40,
              width: 250,
              margin: EdgeInsets.only(top: 50),
              color: Colors.amber[100],
              child: RaisedButton(
                color: Colors.black,
                onPressed: () {
                  context.bloc<PageBloc>().add(GoToHomePage());
                },
                child: Text(
                  'Masuk',
                  style: font2.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
