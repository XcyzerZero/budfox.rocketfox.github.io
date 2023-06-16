// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rocket_fox_web/functions/rocket_fox/Layouts/Pages/page_start_screen.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';
import '../Widgets/widget_barrier.dart';
import '../Widgets/widget_bird.dart';
import '../Widgets/widget_cover.dart';

class GamePage extends StatefulWidget {
  GamePage({Key? key}) : super(key: key);
  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double stake = 10;
  double gameScore = 0;
  double multiplier = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Center(
          child: Column(children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: background(Str.image),
                child: Stack(
                  children: [
                    Bird(yAxis, birdWidth, birdHeight),
                    // Tap to play text
                    Container(
                      alignment: Alignment(0, -0.3),
                      child: myText(gameHasStarted ? '' : 'TAP TO START',
                          Colors.white, 25),
                    ),
                    Barrier(
                        barrierHeight[0][0], barrierWidth, barrierX[0], true),
                    Barrier(
                        barrierHeight[0][1], barrierWidth, barrierX[0], false),
                    Barrier(
                        barrierHeight[1][0], barrierWidth, barrierX[1], true),
                    Barrier(
                        barrierHeight[1][1], barrierWidth, barrierX[1], false),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Cover(
                multiplier: multiplier,
                score: gameScore,
                value: stake,
                multiply: multiplier,
              ),
            ),
          ]),
        ),
      ),
    );
  }

  // Jump Function:
  void jump() {
    setState(() {
      time = 0;
      initialHeight = yAxis;
    });
  }

  //Start Game Function:
  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 35), (timer) {
      height = gravity * time * time + velocity * time;
      setState(() {
        yAxis = initialHeight - height;
      });
      /* <  Barriers Movements  > */
      setState(() {
        if (barrierX[0] < screenEnd) {
          barrierX[0] += screenStart;
        } else {
          barrierX[0] -= barrierMovement;
        }
      });
      setState(() {
        if (barrierX[1] < screenEnd) {
          barrierX[1] += screenStart;
        } else {
          barrierX[1] -= barrierMovement;
        }
      });
      if (birdIsDead()) {
        timer.cancel();
        _showDialog();
      }
      time += 0.032;
    });
    /* <  Calculate Score  > */
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (birdIsDead()) {
        timer.cancel();
        score = 0;
      } else {
        setState(() {
          gameScore++;

          if (gameScore % 10 == 0) {
            multiplier += 0.2;
          }
        });
      }
    });
  }

  /// Make sure the [Bird] doesn't go out screen & hit the barrier
  bool birdIsDead() {
    // Screen
    if (yAxis > 1.26 || yAxis < -1.1) {
      return true;
    }

    /// Barrier hitBox
    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          (barrierX[i] + (barrierWidth)) >= birdWidth &&
          (yAxis <= -1 + barrierHeight[i][0] ||
              yAxis + birdHeight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }
    return false;
  }

  void resetGame() {
    Navigator.pop(context); // dismisses the alert dialog
    setState(() {
      gameScore = 0;
      multiplier = 0;
      yAxis = 0;
      gameHasStarted = false;
      time = 0;
      score = 0;
      initialHeight = yAxis;
      barrierX[0] = 2;
      barrierX[1] = 3.4;
    });
  }

  // TODO: Alert Dialog with 2 options (try again, exit)
  void _showDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
          title: Center(child: myText("Game Over", Colors.red[900], 35)),
          actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
          content: Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              "WIN: ${stake * multiplier}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40,
                fontFamily: "Magic4",
                color: Colors.blue[900],
              ),
            ),
          ),
          actions: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  tryAgainButton(() {
                    resetGame();
                  }),
                  resetButton(
                    () {
                      resetGame();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StartScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
