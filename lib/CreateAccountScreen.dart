import 'package:add/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SplashScreen.dart';
import 'NewPasswordScreen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  // Chọn quốc gia từ dropdown
  String? selectedFlag = '🇺🇸';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Account'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // NFT Number Input với Dropdown Menu cờ các quốc gia
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'NFT Number',
                    prefixIcon: ClipOval(
                      child: DropdownButton<String>(
                        value: selectedFlag,
                        items: <String>['🇺🇸', '🇬🇧', '🇮🇳', '🇩🇪', '🇯🇵']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(fontSize: 30)),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedFlag = newValue;
                          });
                        },
                        underline: Container(), // Ẩn đường viền của dropdown
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Nút Log In
              Container(
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF124984), // Màu xanh
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              // Divider với chữ "OR" ở giữa
              Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text('OR'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              SizedBox(height: 24),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Google Button
                  Container(
                    width: 400,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/google.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit
                            .contain, // Đảm bảo tỉ lệ phù hợp mà không bị biến dạng
                      ),
                      label: Text('Google'),
                    ),
                  ),
                  SizedBox(width: 16),

                  // Facebook Button
                  Container(
                    width: 400,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/facebookIcon.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      label: Text('Facebook'),
                    ),
                  ),
                  SizedBox(width: 16),

                  // MetaMask Button
                  Container(
                    width: 400,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset(
                        'assets/icon/metaMask.png',
                        width: 30,
                        height: 30,
                        fit: BoxFit.contain,
                      ),
                      label: Text('MetaMask'),
                    ),
                  ),
                ],
              ),

              // "New Here? Create Account" Text và Button
              SizedBox(height: 24),
              TextButton(
                onPressed: () {
                  // Điều hướng đến trang tạo tài khoản (Create Account)
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Already have an account? Log IN',
                  style: TextStyle(fontSize: 16, color: Color(0xFF124984)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
