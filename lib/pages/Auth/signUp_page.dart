import 'package:bazar_books_mobile_app_cloning/pages/Auth/signIn_page.dart';
import 'package:bazar_books_mobile_app_cloning/pages/Verification/pin_verification_page.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<StatefulWidget> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
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
              onPressed: () {},
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
                H3(text: "Sign Up"),
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
              text: "Create account and choose favorite menu",
              fontWeight: FontWeight.normal,
              color: AppColors.greyscale500,
            ),
            SizedBox(
              height: 20,
            ),

            //Name Text Field
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Name",
                  color: AppColors.greyscale900,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Your Name",
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

            //Login btn
            Center(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary500),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PinVerificationPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 327,
                child: MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Register",
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
                  text: "Have an account? ",
                  color: AppColors.greyscale400,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                  child: MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Sign In",
                    color: AppColors.primary500,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 25,
            ),

            Expanded(child: Container()),

            //Term, Data Policy
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MediumText(
                    text: "By clicking Register, you agree to our",
                    color: AppColors.greyscale500,
                  ),
                  MediumText(
                    text: "Term, Data Policy",
                    color: AppColors.primary500,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
