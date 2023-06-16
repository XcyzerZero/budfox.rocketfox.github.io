import 'package:flutter/material.dart';
import 'package:rocket_fox_web/common/constant/app_colors.dart';
import 'package:rocket_fox_web/functions/auth/presentation/view_models/widgets/auth_widgets.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.n900,
      body: Center(
          child: Container(
        height: 400,
        width: 700,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: AppColors.n500),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            buildLogoWidget(),
            buildAuthTextForm(context),
          ],
        ),
      )),
    );
  }
}
