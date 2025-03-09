import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h1.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(color: AppColors.primary500),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_logo.png",
              width: 60,
              height: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              margin: EdgeInsets.only(right: 70),
              child: H1(
                text: "Bazar.",
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
