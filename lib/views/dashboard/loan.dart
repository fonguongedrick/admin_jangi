import 'package:admin_jangi/views/dashboard/loanDetails.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/loanRequest.dart';
class Loan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loan',style: TextStyle(fontSize: 32,color: primaryColor),),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFF3F3F3),
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Recent Loan transactions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              //SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Ma Ashu pay debt',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Pa Tiku takes debt',
                      amount: '- 300, 000',
                      amountColor: Colors.red,
                    ),
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Ma Ashu pay debt',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Pa Tiku takes debt',
                      amount: '- 300, 000',
                      amountColor: Colors.red,
                    ),
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Ma Ashu pay debt',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Pa Tiku takes debt',
                      amount: '- 300, 000',
                      amountColor: Colors.red,
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

class TransactionTile extends StatelessWidget {
  final String date;
  final String description;
  final String amount;
  final Color amountColor;

  TransactionTile({
    required this.date,
    required this.description,
    required this.amount,
    required this.amountColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoanDetailsScreen()),
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
            
            
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16,),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold ),
                  ),
                  Text(
                    date,
                    style: TextStyle(color: Colors.grey, ),
                  ),
                  
                ],
              ),
            ),
            Text(
              amount,
              style: TextStyle(color: amountColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
