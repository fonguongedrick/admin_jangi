import 'package:admin_jangi/views/dashboard/eventDetails.dart';
import 'package:admin_jangi/views/dashboard/loan.dart';
import 'package:admin_jangi/views/dashboard/loanRequest.dart';
import 'package:admin_jangi/views/dashboard/savings.dart';
import 'package:admin_jangi/views/dashboard/sinkingfunds.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';



class Transactions extends StatelessWidget {
  

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFF3F3F3),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text('Transactions', style: TextStyle(fontSize: 32, color: primaryColor),),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                  ],
                ),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                 Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Loan()),
        );
                },
                child: Container(
                  height: 160,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF1C2B35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''),
                      Text(''),
                      Text(
                        'Loan',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Savings()),
        );
                },
                child: Container(
                  height: 160,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primaryColor, width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''),
                      Text(''),
                      Text(
                        'Savings',
                        style: TextStyle(color: primaryColor, fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info, color: primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                 Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Sinkingfunds()),
        );
                },
                child: Container(
                  height: 160,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFF1C2B35),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''),
                      Text(''),
                      Text(
                        'Singking Funds',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
            
          
        
      
    
  


           
            ],
          ),
        ),
      ),
      
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String date;
  final String description;
  final String amount;

  TransactionTile({
    required this.date,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EventDetail()),
        );
      },
      child: Container(
        height: 94,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                              color: Color(0xFF1C2B35),
                            borderRadius: BorderRadius.circular(13)
                          ),
              child: Icon(Icons.money, color: Colors.white),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, ),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold ),
                  ),
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}