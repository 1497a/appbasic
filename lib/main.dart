import 'package:add/CreateAccountScreen.dart';
import 'package:add/IntroductionScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'LoginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Splash Screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Trang khởi động là SplashScreen
      routes: {
        '/': (context) => introduceScreen(), // Route của SplashScreen
        '/home': (context) => HomePage(), // Route của trang chính (HomePage)
      },
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hiển thị GIF động
            Image.asset(
              'assets/images/5.gif', // Đường dẫn GIF
              height: 300, // Chiều cao tùy chỉnh
              width: 500, // Chiều rộng tùy chỉnh
            ).animate().fade(duration: 500.ms).scale(),
            SizedBox(height: 24),

            Text(
              'Welcome to EDUCHAIN App!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),

            // Một đoạn text dài
            Text(
              'The EDUCHAIN App provides a seamless platform for managing educational certificates securely and efficiently.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),

            // Nút Log in
            Container(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF124984), // Màu xanh
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Log In',
                  style: TextStyle(fontSize: 18,color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Nút Create an account
            Container(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                  );
                },
                child: Text(
                  'Create a account',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
