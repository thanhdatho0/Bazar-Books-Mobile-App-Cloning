import 'package:bazar_books_mobile_app_cloning/pages/Onboarding/onboarding_page.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h6.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:flutter/material.dart';

class CongratualtionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/Group.png"),
              SizedBox(
                height: 40,
              ),
              H3(text: "Congratulation!"),
              SizedBox(
                height: 10,
              ),
              LargeText(
                text:
                    "your account is complete, please enjoy the best menu from us.",
                textAlign: TextAlign.center,
                color: AppColors.greyscale500,
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnboardingPage()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary500),
                  child: Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 300,
                    child: H6(
                      text: "Get Started",
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
        ),
      )),
    );
  }
}
