import 'package:flutter/material.dart';
import '../../Global/constant.dart';
import '../../Global/functions.dart';
import '../../Resources/strings.dart';
import '../Widgets/widget_bird.dart';
import '../Widgets/widget_gradient _button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);
  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // Todo : initialize the database  <---
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: 700,
          width: 400,
          child: SingleChildScrollView(
            child: Container(
              width: size.width,
              height: size.height,
              decoration: background(Str.image),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Flappy bird text
                    Container(
                        margin: EdgeInsets.only(top: size.height * 0.25),
                        child: myText("RocketFox", Colors.white, 70)),
                    Bird(yAxis, birdWidth, birdHeight),
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      width: 278,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(left: 55),
                              width: 16,
                              height: 30,
                              child: Text(
                                new String.fromCharCodes(new Runes('\u20B1')),
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              height: 60,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      onChanged: (value) => (value),
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        hintText: "Enter Amount",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        disabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Avenir",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                      autocorrect: false,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                    _buttons(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// three buttons
Column _buttons() {
  return Column(
    children: const [
      Button(
        buttonType: "text",
        height: 60,
        width: 278,
        icon: Icon(
          Icons.play_arrow_rounded,
          size: 60,
          color: Colors.green,
        ),
        page: Str.gamePage,
      ),
    ],
  );
}
