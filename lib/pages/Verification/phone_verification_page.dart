import 'package:bazar_books_mobile_app_cloning/pages/Congrats/congratulation_page.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pinput/pinput.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<StatefulWidget> createState() => PhoneVerificationPageState();
}

class PhoneVerificationPageState extends State<PhoneVerificationPage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Go back arrow btn
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PhoneVerificationPage()));
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  H3(text: "Verification Phone"),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              //Sub-title
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text:
                              "Please enter the code we just sent to phone number  ",
                          style: TextStyle(
                            color: AppColors.greyscale500,
                          )),
                      TextSpan(
                          text: "(+84) 0123 456 789",
                          style: TextStyle(color: AppColors.primary500))
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

              //Pin Input Session
              Center(
                child: Pinput(
                  length: 4,
                  controller: _pinPutController,
                  focusNode: _pinPutFocusNode,
                  onCompleted: (pin) {},
                  defaultPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 56,
                    height: 56,
                    textStyle: TextStyle(fontSize: 20, color: Colors.black),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Sign Up btn
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MediumText(
                    fontWeight: FontWeight.bold,
                    text: "If you didn't receive a code? ",
                    color: AppColors.greyscale400,
                  ),
                  MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Resend",
                    color: AppColors.primary500,
                  )
                ],
              ),
              Expanded(child: Container()),

              //Login btn
              Center(
                  child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary500),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CongratualtionPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 300,
                  child: MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Continue",
                    color: Colors.white,
                  ),
                ),
              )),
              SizedBox(
                height: 40,
              ),

              //Bàn phím số
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColors.primary500),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 1.5,
                  children: [
                    for (int i = 1; i <= 9; i++)
                      NumberKey(
                        number: i.toString(),
                        onPressed: () {
                          if (_pinPutController.text.length < 4) {
                            setState(() {
                              _pinPutController.text =
                                  _pinPutController.text + i.toString();
                            });
                          }
                        },
                        isEnabled: true,
                      ),
                    // Nút dấu chấm (không hoạt động)
                    NumberKey(
                      number: '.',
                      onPressed: () {},
                      isEnabled: false,
                    ),
                    // Nút số 0
                    NumberKey(
                      number: '0',
                      onPressed: () {
                        if (_pinPutController.text.length < 4) {
                          setState(() {
                            _pinPutController.text =
                                _pinPutController.text + '0';
                          });
                        }
                      },
                      isEnabled: true,
                    ),
                    // Nút xóa
                    NumberKey(
                      number: '⌫',
                      onPressed: () {
                        if (_pinPutController.text.isNotEmpty) {
                          setState(() {
                            _pinPutController.text = _pinPutController.text
                                .substring(
                                    0, _pinPutController.text.length - 1);
                          });
                        }
                      },
                      isEnabled: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberKey extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;
  final bool isEnabled;

  NumberKey(
      {required this.number, required this.onPressed, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: isEnabled ? onPressed : null,
      child: Container(
        padding: EdgeInsets.all(10),
        // decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Center(
          child: H3(
            text: number,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
