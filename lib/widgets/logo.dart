import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        Image.asset(
          './assets/images/aog-white.png',
          height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Álcool ou Gasolina",
          style: TextStyle(
              color: Colors.white,
              fontSize: 40,
              fontFamily: "Big Shoulders Display"),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
