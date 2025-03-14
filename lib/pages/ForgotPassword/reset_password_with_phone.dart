import 'package:bazar_books_mobile_app_cloning/pages/Verification/reset_password_phone_verify.dart';
import 'package:bazar_books_mobile_app_cloning/utils/colors.dart';
import 'package:bazar_books_mobile_app_cloning/widgets/large_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'forgot_password_page.dart';

class ResetPasswordWithPhonePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPasswordWithPhonePageState();
}

class ResetPasswordWithPhonePageState
    extends State<ResetPasswordWithPhonePage> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocusNode = FocusNode();
  String _digits = ''; // Lưu trữ các chữ số người dùng nhập

  // Mã quốc gia cố định
  static const String countryCode = '(+84)';

  // Hàm định dạng số điện thoại
  String _formatPhoneNumber(String digits) {
    if (digits.isEmpty) return countryCode;

    // Giới hạn tối đa 10 chữ số
    if (digits.length > 10) digits = digits.substring(0, 10);

    // Định dạng: "(+84) 123 456 7890"
    String formatted = countryCode;
    if (digits.length > 0) {
      formatted +=
          ' ' + digits.substring(0, digits.length > 3 ? 3 : digits.length);
    }
    if (digits.length > 3) {
      formatted +=
          ' ' + digits.substring(3, digits.length > 6 ? 6 : digits.length);
    }
    if (digits.length > 6) {
      formatted += ' ' + digits.substring(6);
    }

    return formatted;
  }

  @override
  void initState() {
    super.initState();
    _phoneController.text = countryCode; // Khởi tạo với mã quốc gia
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 0),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ForgotPasswordPage())); // Quay lại
              },
              icon: FaIcon(
                FontAwesomeIcons.arrowLeft,
                size: 24,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text("Reset Password",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 5),
            Text(
              "Please enter your phone number, we will send a verification code to your phone.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey),
            ),
            SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LargeText(
                  text: "Phone Number",
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
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
                            FilteringTextInputFormatter
                                .digitsOnly, // Chỉ cho phép nhập số
                          ],
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '(+84) 123 456 7890',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          onChanged: (value) {
                            // Loại bỏ tất cả ký tự không phải số
                            String newDigits =
                                value.replaceAll(RegExp(r'\D'), '');

                            // Nếu chuỗi bắt đầu bằng "84", loại bỏ nó
                            if (newDigits.startsWith('84')) {
                              newDigits = newDigits.substring(2);
                            }

                            // Cập nhật _digits
                            _digits = newDigits;

                            // Định dạng lại số điện thoại
                            String formatted = _formatPhoneNumber(_digits);

                            // Cập nhật controller và giữ vị trí con trỏ ở cuối
                            _phoneController.value = TextEditingValue(
                              text: formatted,
                              selection: TextSelection.collapsed(
                                  offset: formatted.length),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                onPressed: () {
                  if (_digits.length == 11) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResetPasswordPhoneVerifyPage()));
                    // Thêm logic gửi mã xác nhận tại đây
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text("Vui lòng nhập số điện thoại hợp lệ")),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: 327,
                  child: Text(
                    "Send",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
