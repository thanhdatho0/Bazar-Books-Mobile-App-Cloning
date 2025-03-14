import 'package:bazar_books_mobile_app_cloning/pages/Auth/signUp_page.dart';
import 'package:bazar_books_mobile_app_cloning/pages/ForgotPassword/forgot_password_page.dart';
import 'package:bazar_books_mobile_app_cloning/pages/Onboarding/onboarding_page.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h6.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<StatefulWidget> createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Go back arrow btn
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 0),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => OnboardingPage()));
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 24,
              ),
            ),
            SizedBox(
              height: 20,
            ),

            //Title
            Row(
              children: [
                H3(text: "Welcome Back"),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  FontAwesomeIcons.handsClapping,
                  color: Colors.yellow,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            //Sub-title
            LargeText(
              text: "Sign to your account",
              fontWeight: FontWeight.normal,
              color: AppColors.greyscale500,
            ),
            SizedBox(
              height: 20,
            ),

            //Email Text Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Email",
                  color: AppColors.greyscale900,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Your Email",
                      hintStyle: TextStyle(color: AppColors.greyscale400),
                      filled: true,
                      fillColor: AppColors.greyscale100,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyscale50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyscale50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyscale500),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Password Text Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Password",
                  color: AppColors.greyscale900,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Your Password",
                      hintStyle: TextStyle(color: AppColors.greyscale400),
                      filled: true,
                      fillColor: AppColors.greyscale100,
                      suffixIcon: Icon(
                        FontAwesomeIcons.eyeSlash,
                        color: AppColors.greyscale500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyscale50),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.greyscale50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(color: AppColors.primary500),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Forgot Password text
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage()));
              },
              child: MediumText(
                fontWeight: FontWeight.w600,
                text: "Forgot Password?",
                color: AppColors.primary500,
              ),
            ),

            SizedBox(
              height: 20,
            ),

            //Login btn
            Center(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary500),
              onPressed: () {},
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 327,
                child: MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Login",
                  color: Colors.white,
                ),
              ),
            )),
            SizedBox(
              height: 20,
            ),

            //Sign Up btn
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Don't have an account? ",
                  color: AppColors.greyscale400,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignUpPage()));
                  },
                  child: MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Sign Up",
                    color: AppColors.primary500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),

            //Divide session
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: AppColors.greyscale400,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                H6(
                  text: "Or with",
                  color: AppColors.greyscale400,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Divider(
                    color: AppColors.greyscale400,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),

            //Login with google
            Center(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.greyscale200)),
                  onPressed: () {},
                  child: SizedBox(
                    height: 48,
                    width: 327,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(FontAwesomeIcons.google),
                        SizedBox(
                          width: 10,
                        ),
                        MediumText(
                          text: "Sign in with Google",
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),

            //Login with Apple
            Center(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: AppColors.greyscale200)),
                  onPressed: () {},
                  child: SizedBox(
                    height: 48,
                    width: 327,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.apple,
                          size: 20,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        MediumText(
                          text: "Sign in with Apple",
                          fontWeight: FontWeight.bold,
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
