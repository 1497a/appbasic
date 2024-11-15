import 'package:flutter/material.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  @override
  _CreateNewPasswordScreenState createState() => _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  // TextEditingController để kiểm soát các trường nhập
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Các điều kiện kiểm tra mật khẩu
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasSpecialChar = false;
  bool hasMinLength = false;
  bool passwordsMatch = false;
  bool _obscurePassword = true; // Ẩn/hiện mật khẩu
  bool _obscureConfirmPassword = true; // Ẩn/hiện mật khẩu xác nhận

  @override
  void initState() {
    super.initState();
    // Lắng nghe sự thay đổi trong các trường nhập mật khẩu
    passwordController.addListener(_checkPasswordConditions);
    confirmPasswordController.addListener(_checkPasswordsMatch);
  }

  // Kiểm tra các điều kiện mật khẩu
  void _checkPasswordConditions() {
    final password = passwordController.text;

    setState(() {
      hasUpperCase = password.contains(RegExp(r'[A-Z]')); // Kiểm tra chữ hoa
      hasLowerCase = password.contains(RegExp(r'[a-z]')); // Kiểm tra chữ thường
      hasSpecialChar = password.contains(RegExp(r'[@$!%*?&]')); // Kiểm tra ký tự đặc biệt
      hasMinLength = password.length >= 8; // Kiểm tra độ dài
    });
  }

  // Kiểm tra mật khẩu và confirm password có trùng khớp không
  void _checkPasswordsMatch() {
    setState(() {
      passwordsMatch = passwordController.text == confirmPasswordController.text;
    });
  }

  @override
  void dispose() {
    // Đừng quên giải phóng controller khi không còn dùng
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Password'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Password Input Field
            TextField(
              controller: passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'New Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30), // Border tròn
                ),
              ),
            ),
            SizedBox(height: 16),

            // Hiển thị các điều kiện mật khẩu
            _buildPasswordCondition('Both upper & lower-case letter', hasUpperCase && hasLowerCase),
            _buildPasswordCondition('One symbol', hasSpecialChar),
            _buildPasswordCondition('At least 8 characters', hasMinLength),

            SizedBox(height: 16),

            // Confirm Password Input Field
            Center( // Đưa Confirm Password ra giữa màn hình
              child: Container(
                width: 400,
                child: TextField(
                  controller: confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30), // Border tròn
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),

            if (!passwordsMatch)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  'Passwords do not match',
                  style: TextStyle(color: Colors.red),
                ),
              ),

            Center( // Căn giữa nút Continue
              child: Container(
                width: 200, // Đặt chiều rộng cho nút
                child: ElevatedButton(
                  onPressed: (hasUpperCase && hasLowerCase && hasSpecialChar && hasMinLength && passwordsMatch)
                      ? () {
                    // Tiến hành chuyển màn hoặc logic tiếp theo ở đây
                    print('Password is valid!');
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF124984),
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
            ),
          ],
        ),
      ),
    );
  }

  // Hàm xây dựng điều kiện mật khẩu với biểu tượng check
  Widget _buildPasswordCondition(String condition, bool isValid) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
        ),
        SizedBox(width: 8),
        Text(
          condition,
          style: TextStyle(
            fontSize: 16,
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
