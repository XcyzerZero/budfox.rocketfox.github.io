import 'package:flutter/material.dart';
import 'package:rocket_fox_web/functions/rocket_fox/Layouts/pages/page_start_screen.dart';
import '../../../../../common/constant/app_colors.dart';

Widget buildLogoWidget() {
  return Expanded(
    flex: 3,
    child: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.n500, AppColors.n900],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/budfox_logo.png"),
              ),
            ),
          ),
          const Text(
            "BudFox Gaming",
            style: TextStyle(
              color: Color(0xFFdba649),
              fontFamily: "Anton",
              fontSize: 34,
            ),
          ),
        ],
      )),
    ),
  );
}

Widget buildAuthTextForm(BuildContext context) {
  return Expanded(
    flex: 4,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 52, vertical: 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFdba649), Color(0xFFb4893b)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 32,
                fontFamily: "Anton",
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            " Email Address",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          buildAuthTextField(
            context: context,
            textType: "email",
            hintText: "email",
            iconName: const Icon(
              Icons.email,
              color: Colors.black,
            ),
          ),
          const Text(
            " Password",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          buildAuthTextField(
              context: context,
              textType: "password",
              hintText: "password",
              iconName: const Icon(
                Icons.lock,
                color: Colors.black,
              )),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: AppColors.p100,
                  foregroundColor: AppColors.n900,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StartScreen()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontFamily: "Anton"),
                )),
          ),
        ],
      ),
    ),
  );
}

Widget buildAuthTextField({
  required BuildContext context,
  required String textType,
  required String hintText,
  required Icon iconName,
  void Function(String value)? func,
}) {
  return Container(
    margin: const EdgeInsets.only(
      bottom: 20,
    ),
    width: MediaQuery.of(context).size.width,
    height: 40,
    decoration: BoxDecoration(
      color: const Color(0xFFb4893b),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      border: Border.all(color: AppColors.n900, width: 1),
    ),
    child: Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 12),
          width: 30,
          height: 30,
          child: iconName,
        ),
        SizedBox(
          width: 210,
          height: 50,
          child: TextField(
            keyboardType: TextInputType.multiline,
            onChanged: (value) => func!(value),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(10),
              hintText: hintText,
              hintStyle: const TextStyle(color: AppColors.n900),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.n400),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        ),
      ],
    ),
  );
}
