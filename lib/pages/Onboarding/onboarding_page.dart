import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h6.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/large_text.dart';
import '../../widgets/medium_text.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  OnboardingPageSate createState() => OnboardingPageSate();
}

class OnboardingPageSate extends State<OnboardingPage> {
  PageController pageController = PageController(viewportFraction: 1);
  var _currPageVal = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageVal = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
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
            Container(
              margin: EdgeInsets.only(left: 20),
              child: MediumText(
                fontWeight: FontWeight.bold,
                text: "Skip",
                color: AppColors.primary500,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 500,
              child: PageView.builder(
                  controller: pageController,
                  itemCount: 3,
                  onPageChanged: (int page) {
                    setState(() {
                      _currPageVal = page.toDouble();
                    });
                  },
                  itemBuilder: (context, index) {
                    return _buildPageItem(index);
                  }),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: ExpandingDotsEffect(
                  spacing: 8.0,
                  dotWidth: 12,
                  dotHeight: 12,
                  radius: 12,
                  activeDotColor: AppColors.primary500,
                ),
              ),
            ),
            Expanded(child: Container()),
            Center(
              child: Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColors.primary500),
                      onPressed: () {
                        if (_currPageVal < 2) {
                          pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 56,
                        width: 327,
                        child: H6(
                          text: _currPageVal.round() == 2
                              ? "Get Started"
                              : "Continue",
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: AppColors.primary50),
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        height: 56,
                        width: 327,
                        child: H6(
                          text: "Sign In",
                          color: AppColors.primary500,
                        ),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageItem(int index) {
    return SizedBox(
      child: Column(
        children: [
          Image.asset(
            "assets/images/onboarding/picture${index + 1}.png",
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 70,
            margin: EdgeInsets.only(right: 60, left: 60),
            child: H3(
              text: _getSlideTitle(index),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30),
            child: LargeText(
              fontWeight: FontWeight.normal,
              color: AppColors.greyscale500,
              text: _getSlideDesc(index),
            ),
          )
        ],
      ),
    );
  }
}

String _getSlideTitle(int index) {
  switch (index) {
    case 0:
      return "Now reading books will be easier";
    case 1:
      return "Your Bookish Soulmate Awaits";
    case 2:
      return "Start Your Adventure";
    default:
      return "";
  }
}

String _getSlideDesc(int index) {
  switch (index) {
    case 0:
      return " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.";
    case 1:
      return "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.";
    case 2:
      return "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!";
    default:
      return "";
  }
}
