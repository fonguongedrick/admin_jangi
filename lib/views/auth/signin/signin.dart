import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/widgets/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/home.dart';
import 'package:admin_jangi/views/dashboard/widgets/dashboard.dart';
class SignIn extends StatefulWidget {
  
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
   bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
         //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text('Welcome back', 
              style: TextStyle(
                color: primaryColor,
                fontSize: 32,
                fontWeight: FontWeight.w600
              ),),
            ),
            SizedBox(height: 32,),
            
            SizedBox(height: 16,),
             Align(
              alignment: Alignment.centerLeft,
              child: Text('Personal Identification Number')),
            SizedBox(height: 8,),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFC7B0B0)
              ),
              child: TextField(
                cursorColor:Colors.black,
                decoration: InputDecoration(
                  hintText: 'E.g 12AB23CD',
                   hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  border: InputBorder.none,
                  
                  contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                ),
              ),
            ),
            SizedBox(height: 16,),
             Align(
              alignment: Alignment.centerLeft,
              child: Text('Password')),
            SizedBox(height: 8,),
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xFFC7B0B0)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      cursorColor:Colors.black,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: '************',
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
                                  _obscureText ? Icons.visibility_off : Icons.visibility,
                                  color: primaryColor,
                                ),
                              ),
                ],
              ),
            ),
            SizedBox(height: 50,),
             Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryColor
              ),
              child: TextButton(onPressed: (){
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DashboardScreen()),
                    );
    
              }, child: Text('LOGIN',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white,
              fontSize: 11),)))
          ],
        ),
      ),
    );
  }
}