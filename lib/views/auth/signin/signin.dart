import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/widgets/dashboard.dart';
import 'package:admin_jangi/views/dashboard/home.dart';
import 'package:admin_jangi/views/secretary/dashboard/dashboard.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
  bool _isLoading = false;
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse('https://814f-102-244-155-214.ngrok-free.app/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone_number': _phoneController.text,
        'unique_id': _pinController.text,
      }),
    );

    setState(() {
      _isLoading = false;
    });
     print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = json.decode(response.body);
      final String userType = data['type'];

      // Store login status and user type in shared preferences
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      await prefs.setString('userType', userType);

      if (userType == 'admin') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => DashboardScreen()),
        );
      } else if (userType == 'secretary') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SecretaryDashboard()),
        );
      } else {
        // Handle other user types or show an error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid user ')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? Center(
              child: SpinKitCircle(
                color: primaryColor,
                size: 50.0,
              ),
            )
          : Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Welcome back',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Phone Number'),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC7B0B0),
                    ),
                    child: TextField(
                      controller: _phoneController,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                        hintText: 'E.g 680692014',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Personal Identification Number'),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFFC7B0B0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _pinController,
                            cursorColor: Colors.black,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: '12AB23CD',
                              hintStyle: TextStyle(fontWeight: FontWeight.bold),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor,
                    ),
                    child: TextButton(
                      onPressed: _login,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 11,
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
