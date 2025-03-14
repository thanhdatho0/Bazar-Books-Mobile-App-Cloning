import 'package:bazar_books_mobile_app_cloning/pages/ForgotPassword/forgot_password_page.dart';
import 'package:bazar_books_mobile_app_cloning/pages/Verification/reset_password_email_verify.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/colors.dart';
import '../../widgets/h3.dart';
import '../../widgets/large_text.dart';
import '../../widgets/medium_text.dart';

class ResetPasswordWithEmailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPasswordWithEmailPageState();
}

class ResetPasswordWithEmailPageState
    extends State<ResetPasswordWithEmailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Go back arrow btn
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 0),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ForgotPasswordPage())); // Go back
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 24,
              ),
            ),
            SizedBox(height: 20),

            // Title
            Row(
              children: [
                H3(text: "Reset Password"),
              ],
            ),
            SizedBox(height: 5),

            // Sub-title
            LargeText(
              text:
                  "Please enter your email, we will send verification code to your email.",
              fontWeight: FontWeight.normal,
              color: AppColors.greyscale500,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),

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

            // Login btn
            Center(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary500),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResetPasswordEmailVerifyPage()));
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 327,
                child: MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Send",
                  color: Colors.white,
                ),
              ),
            )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _selectedIndex {}
