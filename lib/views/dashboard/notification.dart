import 'package:admin_jangi/style.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Notification', style: TextStyle(fontSize: 24, color: primaryColor),),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ma Anna’s Loan Request",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "500, 000 XAF",
                        style: TextStyle(fontSize: 20,  color: primaryColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Accept button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Accept', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('21', style: TextStyle(fontSize: 14))
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Decline button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Decline', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('7', style:TextStyle(fontSize: 14))
                                ],
                              ),
                            ],
                          ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Akonui's Loan Request",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "300, 000 XAF",
                        style: TextStyle(fontSize: 20,  color: primaryColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Accept button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Accept', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('21', style: TextStyle(fontSize: 14))
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Decline button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Decline', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('7', style:TextStyle(fontSize: 14))
                                ],
                              ),
                            ],
                          ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Taniform's Loan Request",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "200, 000 XAF",
                        style: TextStyle(fontSize: 20,  color: primaryColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Accept button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Accept', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('21', style: TextStyle(fontSize: 14))
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Decline button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Decline', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('7', style:TextStyle(fontSize: 14))
                                ],
                              ),
                            ],
                          ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Fon's Loan Request",
                        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600, color: primaryColor),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "250, 000 XAF",
                        style: TextStyle(fontSize: 20,  color: primaryColor),
                      ),
                      SizedBox(height: 20),
                      Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Accept button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Accept', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('21', style: TextStyle(fontSize: 14))
                                ],
                              ),
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      // Your existing onPressed logic for the Decline button (or add new logic)
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Color(0xFFC7B0B0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                                      child: Center(
                                        child: Text('Decline', style: TextStyle(color: primaryColor)),
                                      ),
                                    ),
                                  ),
                                  Text('7', style:TextStyle(fontSize: 14))
                                ],
                              ),
                            ],
                          ),
        
                    ],
                  ),
                ),
                SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}