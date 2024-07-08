import 'package:admin_jangi/views/dashboard/loanDetails.dart';
import 'package:admin_jangi/views/dashboard/transactDetails.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/loanRequest.dart';

class Contribution extends StatelessWidget {
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
              Text('Contributions', style: TextStyle(fontSize: 32, color: primaryColor),),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              color: Color(0xFFBFC6CB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jangi Meet',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Ngwa Tebo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Sun 5th April 2024',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              color: Color(0xFF1C2B35),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jangi Meet',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Fon Ashu',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Sun 5th April 2024',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              color: Color(0xFFBFC6CB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Jangi Meet',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(
                                        Icons.info,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Ngwa Tebo',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Sun 5th April 2024',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recent Contributions',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 16),
                    Column(
                      children: [
                        TransactionTile(
                          hostNumber: 'Host 1',
                          date: '26 October 2024',
                          description: 'Akonui Marcel',
                          amount: '+ 250,000',
                        ),
                        TransactionTile(
                          hostNumber: 'Host 2',
                          date: '26 October 2024',
                          description: 'Ngu Taniform',
                          amount: '+ 250,000',
                        ),
                        TransactionTile(
                          hostNumber: 'Host 3',
                          date: '26 October 2024',
                          description: 'Kinyuy Ndoh',
                          amount: '+ 250,000',
                        ),
                        TransactionTile(
                          hostNumber: 'Host 4',
                          date: '26 October 2024',
                          description: 'Nfor Jato',
                          amount: '+ 250,000',
                        ),
                        TransactionTile(
                          hostNumber: 'Host 5',
                          date: '26 October 2024',
                          description: 'Joy Chia',
                          amount: '+ 250,000',
                        ),
                        TransactionTile(
                          hostNumber: 'Host 6',
                          date: '26 October 2024',
                          description: 'Derick Fonyuy',
                          amount: '+ 250,000',
                        ),
                      ],
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
  final String hostNumber;
  final String date;
  final String description;
  final String amount;

  TransactionTile({
    required this.hostNumber,
    required this.date,
    required this.description,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TransactionsDetail()),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 13),
                Text(
                  hostNumber,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  date,
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  amount,
                  style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
