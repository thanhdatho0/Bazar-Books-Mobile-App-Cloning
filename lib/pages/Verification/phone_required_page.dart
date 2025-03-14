import 'package:bazar_books_mobile_app_cloning/pages/Verification/phone_verification_page.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/h3.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/medium_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PhoneRequiredPage extends StatefulWidget {
  const PhoneRequiredPage({super.key});

  @override
  State<StatefulWidget> createState() => PhoneRequiredPageState();
}

class PhoneRequiredPageState extends State<PhoneRequiredPage> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();

  // Mã quốc gia cố định
  final String countryCode = '(+84)';

  // Hàm định dạng số điện thoại
  String _formatPhoneNumber(String digits) {
    // Nếu không có số nào, trả về mã quốc gia
    if (digits.isEmpty) return countryCode;

    // Giới hạn tối đa 11 chữ số
    if (digits.length > 11) digits = digits.substring(0, 11);

    // Định dạng số: 123 456 78901 (3-4-4)
    String part1 = digits.length > 0
        ? digits.substring(0, digits.length > 3 ? 3 : digits.length)
        : '';
    String part2 = digits.length > 3
        ? digits.substring(3, digits.length > 7 ? 7 : digits.length)
        : '';
    String part3 = digits.length > 7 ? digits.substring(7, digits.length) : '';

    // Kết hợp mã quốc gia và số
    String formatted = countryCode;
    if (part1.isNotEmpty) formatted += ' $part1';
    if (part2.isNotEmpty) formatted += ' $part2';
    if (part3.isNotEmpty) formatted += ' $part3';

    return formatted;
  }

  @override
  void initState() {
    super.initState();
    // Đặt giá trị mặc định cho ô nhập
    _phoneController.text = countryCode;
  }

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
                padding: EdgeInsets.only(left: 10),
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  H3(text: "Phone Number"),
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      LargeText(
                        textAlign: TextAlign.center,
                        text:
                            "Please enter your phone number, so we can more easily deliver your order",
                        fontWeight: FontWeight.normal,
                        color: AppColors.greyscale500,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),

              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.phone, color: AppColors.primary500),
                      SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          controller: _phoneController,
                          focusNode: _phoneFocusNode,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '($countryCode) 123 456 78901',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            setState(() {
                              // Lấy phần số sau mã quốc gia
                              String digits = value
                                  .replaceFirst(countryCode, '')
                                  .replaceAll(RegExp(r'\D'), '');
                              // Định dạng lại với mã quốc gia cố định
                              _phoneController.value = TextEditingValue(
                                text: _formatPhoneNumber(digits),
                                selection: TextSelection.collapsed(
                                  offset: _formatPhoneNumber(digits).length,
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
                  MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Sign In",
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
                          builder: (context) => PhoneVerificationPage()));
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 300,
                  child: MediumText(
                    fontWeight: FontWeight.bold,
                    text: "Register",
                    color: Colors.white,
                  ),
                ),
              )),
              SizedBox(
                height: 40,
              ),

              //Bàn phím số
              Container(
                color: AppColors.primary500,
                padding: EdgeInsets.all(16),
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
                          // Lấy phần số hiện tại (loại bỏ mã quốc gia)
                          String digits = _phoneController.text
                              .replaceFirst(countryCode, '')
                              .replaceAll(RegExp(r'\D'), '');
                          if (digits.length < 11) {
                            setState(() {
                              digits += i.toString();
                              _phoneController.text =
                                  _formatPhoneNumber(digits);
                              _phoneController.selection =
                                  TextSelection.collapsed(
                                offset: _phoneController.text.length,
                              );
                            });
                          }
                        },
                        isEnabled: true,
                      ),
                    NumberKey(
                      number: '.',
                      onPressed: () {},
                      isEnabled: false,
                    ),
                    NumberKey(
                      number: '0',
                      onPressed: () {
                        // Lấy phần số hiện tại (loại bỏ mã quốc gia)
                        String digits = _phoneController.text
                            .replaceFirst(countryCode, '')
                            .replaceAll(RegExp(r'\D'), '');
                        if (digits.length < 11) {
                          setState(() {
                            digits += '0';
                            _phoneController.text = _formatPhoneNumber(digits);
                            _phoneController.selection =
                                TextSelection.collapsed(
                              offset: _phoneController.text.length,
                            );
                          });
                        }
                      },
                      isEnabled: true,
                    ),
                    NumberKey(
                      number: '⌫',
                      onPressed: () {
                        // Lấy phần số hiện tại (loại bỏ mã quốc gia)
                        String digits = _phoneController.text
                            .replaceFirst(countryCode, '')
                            .replaceAll(RegExp(r'\D'), '');
                        if (digits.isNotEmpty) {
                          setState(() {
                            digits = digits.substring(0, digits.length - 1);
                            _phoneController.text = _formatPhoneNumber(digits);
                            _phoneController.selection =
                                TextSelection.collapsed(
                              offset: _phoneController.text.length,
                            );
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
