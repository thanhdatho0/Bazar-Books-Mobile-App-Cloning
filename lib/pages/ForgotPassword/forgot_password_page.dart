import 'package:bazar_books_mobile_app_cloning/pages/ForgotPassword/reset_password_with_email.dart';
import 'package:bazar_books_mobile_app_cloning/pages/ForgotPassword/reset_password_with_phone.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/colors.dart'; // Assuming this contains AppColors
import '../../widgets/h3.dart';
import '../../widgets/large_text.dart';
import '../../widgets/medium_text.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgotPasswordPageState();
}

class ForgotPasswordPageState extends State<ForgotPasswordPage> {
  int? _selectedIndex; // null = none selected, 0 = email, 1 = phone

  @override
  void initState() {
    super.initState();
    _selectedIndex = null; // Initially, no button is selected
  }

  @override
  Widget build(BuildContext context) {
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
                Navigator.pop(context); // Go back
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
                H3(text: "Forgot Password"),
              ],
            ),
            SizedBox(height: 5),

            // Sub-title
            LargeText(
              text:
                  "Select which contact details should we use to reset your password",
              fontWeight: FontWeight.normal,
              color: AppColors.greyscale500,
              textAlign: TextAlign.start,
            ),
            SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Email Button
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyscale50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: _selectedIndex == 0
                              ? AppColors.primary500
                              : AppColors.greyscale50,
                          width: _selectedIndex == 0 ? 2.0 : 1.0,
                        ),
                      ),
                      padding: EdgeInsets.zero, // Remove default padding
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0; // Select email
                      });
                      // Add email reset logic here if needed
                    },
                    child: SizedBox(
                      width: 158, // Fixed square size
                      height: 158,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Icon(Icons.email, size: 24),
                          ),
                          MediumText(
                            fontWeight: FontWeight.bold,
                            text: "Email",
                            color: AppColors.greyscale900,
                          ),
                          MediumText(
                            text: "Send to your email",
                            color: AppColors.greyscale600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Phone Button
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.greyscale50,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: _selectedIndex == 1
                              ? AppColors.primary500
                              : AppColors.greyscale50,
                          width: _selectedIndex == 1 ? 2.0 : 1.0,
                        ),
                      ),
                      padding: EdgeInsets.zero, // Remove default padding
                    ),
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1; // Select phone
                      });
                      // Add phone reset logic here if needed
                    },
                    child: SizedBox(
                      width: 158, // Fixed square size
                      height: 158,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(24),
                            child: Icon(Icons.phone, size: 24),
                          ),
                          MediumText(
                            fontWeight: FontWeight.bold,
                            text: "Phone Number",
                            color: AppColors.greyscale900,
                          ),
                          MediumText(
                            text: "Send to your phone",
                            color: AppColors.greyscale600,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),

            // Login btn
            Center(
                child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary500),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (_selectedIndex == 0) {
                    return ResetPasswordWithEmailPage();
                  } else if (_selectedIndex == 1) {
                    return ResetPasswordWithPhonePage();
                  }
                  return ForgotPasswordPage();
                }));
              },
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: 327,
                child: MediumText(
                  fontWeight: FontWeight.bold,
                  text: "Continue",
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
