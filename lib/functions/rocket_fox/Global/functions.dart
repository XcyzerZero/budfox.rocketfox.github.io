// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../Resources/strings.dart';

Text myText(String txt, Color? color, double size) {
  return Text(
    txt,
    style: TextStyle(fontSize: size, fontFamily: "Magic4", color: color),
  );
}

ElevatedButton gameButton(VoidCallback? onPress, String txt, Color color) {
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(backgroundColor: color),
    child: myText(txt, Colors.white, 20),
  );
}

Widget resetButton(VoidCallback? onPress) {
  return Center(
    child: GestureDetector(
      onTap: onPress,
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            Icons.close,
            color: Colors.red,
          )),
    ),
  );
}

Widget tryAgainButton(VoidCallback? onPress) {
  return Center(
    child: Padding(
      padding: EdgeInsets.only(bottom: 5),
      child: GestureDetector(
        onTap: onPress,
        child: CircleAvatar(
          radius: 25,
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          child: Icon(
            Icons.restart_alt,
            size: 35,
          ),
        ),
      ),
    ),
  );
}

BoxDecoration frame() {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black, width: 2),
      color: Colors.white54,
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.6),
            blurRadius: 1.0,
            offset: Offset(5, 5))
      ]);
}

BoxDecoration background(String y) {
  return BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/pics/$y.png"), fit: BoxFit.fill),
  );
}

AlertDialog dialog(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    actionsPadding: EdgeInsets.only(right: 8, bottom: 8),
    title: myText("About Flappy Bird", Colors.black, 22),
    content: Text(
      Str.about,
      style: TextStyle(fontFamily: "Magic4"),
    ),
    actions: [
      gameButton(() {
        Navigator.pop(context);
      }, "Okay", Colors.deepOrange),
    ],
  );
}

void init() {}

void navigate(context, navigate) {
  switch (navigate) {
    case Str.gamePage:
      Navigator.pushNamed(context, Str.gamePage);
      break;
    case Str.settings:
      Navigator.pushNamed(context, Str.settings);
      break;
    case Str.rateUs:
      Navigator.pushNamed(context, Str.rateUs);
      break;
  }
}
