import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h6.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:flutter/material.dart';

import '../Auth/signIn_page.dart';

class PasswordChangedPage extends StatelessWidget {
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
              H3(text: "Password Changed!!"),
              SizedBox(
                height: 10,
              ),
              LargeText(
                text:
                    "Password changed successfully, you can login again with a new password",
                textAlign: TextAlign.center,
                color: AppColors.greyscale500,
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: AppColors.primary500),
                  child: Container(
                    alignment: Alignment.center,
                    height: 38,
                    width: 300,
                    child: H6(
                      text: "Login",
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
