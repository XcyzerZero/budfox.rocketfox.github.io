// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  double value;
  double multiply;
  double multiplier;
  double score;
  Cover({
    Key? key,
    required this.value,
    required this.multiply,
    required this.multiplier,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.brown,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Score : ${score.toInt()}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: "Magic4"),
                  ), // Best TEXT
                  Text("Multiplier : x${multiplier.toStringAsFixed(1)}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontFamily: "Magic4")),
                ],
              ),
            ),
            Text(
              "Stake : P ${value.toInt()}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Magic4"),
            ),
            Text(
              "Winning : P ${(value * multiply).toInt()}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Magic4"),
            ),
          ],
        ));
  }
}
