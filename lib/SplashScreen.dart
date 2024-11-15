import 'package:add/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hình ảnh GIF
            Image.asset(
              'assets/images/1.gif',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ).animate().fade(duration: 500.ms).scale(),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'You have successfully created an account, please enter your account information to start experiencing EDC!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF124984), // Màu nút giống như đã cho
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Border tròn
                ),
                minimumSize: Size(200, 50), // Kích thước nút
              ),
              child: Text(
                'Continue',
                style: TextStyle(
                  color: Colors.white, // Màu chữ trên nút
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
