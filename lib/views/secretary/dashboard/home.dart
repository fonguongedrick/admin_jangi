
import 'package:admin_jangi/views/dashboard/eventDetails.dart';
import 'package:admin_jangi/views/dashboard/notification.dart';
import 'package:admin_jangi/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'package:intl/intl.dart';
//import 'notification.dart';
import 'package:admin_jangi/views/dashboard/transactions.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void showRecordTransactionDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return RecordTransactionDialog();
    },
  );
}

class RecordTransactionDialog extends StatefulWidget {
  @override
  _RecordTransactionDialogState createState() =>
      _RecordTransactionDialogState();
}

class _RecordTransactionDialogState extends State<RecordTransactionDialog> {
  List<String> userNames = [];
  List<String> transactionTypes = ['Loan', 'Savings', 'Contribution'];

  String selectedUserName = '';
  String selectedTransactionType = 'Loan';
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserNames();
  }

  Future<void> fetchUserNames() async {
    final response = await http.get(
      Uri.parse('https://814f-102-244-155-214.ngrok-free.app/api/users'), // Replace with your API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> users = jsonDecode(response.body);
      setState(() {
        userNames = users.map((user) => user['name'] as String).toList();
        if (userNames.isNotEmpty) {
          selectedUserName = userNames[0];
        }
      });
    } else {
      // Handle the case where the server does not return a 200 OK response
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to fetch user names')),
      );
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _submitTransaction() async {
    final String userName = selectedUserName;
    final String transactionType = selectedTransactionType;
    final String amount = amountController.text;
    final String date = selectedTransactionType == 'Loan'
        ? ''
        : dateController.text;
    final String startDate = selectedTransactionType == 'Loan'
        ? startDateController.text
        : '';
    final String endDate = selectedTransactionType == 'Loan'
        ? endDateController.text
        : '';

    if (amount.isEmpty || (selectedTransactionType == 'Loan' && (startDate.isEmpty || endDate.isEmpty))) {
      // Handle the case where some fields are not filled
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill all the required fields')),
      );
      return;
    }

    final response = await http.post(
      Uri.parse('https://814f-102-244-155-214.ngrok-free.app/api/transactions/create'), // Replace with your server API endpoint
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'user_name': userName,
        'type': transactionType,
        'amount': amount,
        'date': date,
        'start_date': startDate,
        'end_date': endDate,
      }),
    );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
    if (response.statusCode == 201) {
      // If the server returns a 200 OK or 201 Created response, show success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Transaction recorded successfully!')),
      );
      Navigator.of(context).pop(); // Close the dialog
    } else {
      // If the server did not return a 200 OK or 201 Created response, show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to record transaction')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Record a transaction',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 32),
            Text('Your Name'),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: selectedUserName,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedUserName = newValue;
                  }
                });
              },
              items: userNames.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Transaction Type'),
            SizedBox(height: 5),
            DropdownButtonFormField<String>(
              value: selectedTransactionType,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    selectedTransactionType = newValue;
                  }
                });
              },
              items: transactionTypes.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('Enter Amount'),
            SizedBox(height: 5),
            TextField(
              controller: amountController,
              decoration: InputDecoration(
                hintText: '000 XAF',
                filled: true,
                fillColor: Color(0xFFD9D9D9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            if (selectedTransactionType == 'Loan') ...[
              SizedBox(height: 10),
              Text('Start Date'),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  _selectDate(context, startDateController);
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: startDateController,
                    decoration: InputDecoration(
                      hintText: 'Pick a date',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text('Due Date'),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  _selectDate(context, endDateController);
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: endDateController,
                    decoration: InputDecoration(
                      hintText: 'Pick a date',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ] else if (selectedTransactionType != 'Loan') ...[
              SizedBox(height: 10),
              Text('Date'),
              SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  _selectDate(context, dateController);
                },
                child: AbsorbPointer(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      hintText: 'Pick a date',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ],
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    await _submitTransaction();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 32.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 32.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


class secretaryHomePage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         // Assuming you have a title
  flexibleSpace: Container(
    decoration: BoxDecoration(
      color:   Color(0xFF1C2B35)
    ),
  ),


        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(onPressed: (){
            Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
            }, icon: Icon(Icons.person, color: primaryColor)),
          ),
        ),
        title: Text('Welcome, Admin', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NotificationPage()),
        );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Color(0xFF1C2B35)
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Sinking Funds:',  style: TextStyle(color: Colors.white, fontSize: 16),),
                    Text(
                      'Total Saved:',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '100,000 XAF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '150,000 XAF',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
  children: [
    GestureDetector(
      onTap: () {
        // Your existing onPressed logic for the Transactions button
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Transactions()),
        );
      },
      child: Container(
        padding: EdgeInsets.all(4),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.list),
            SizedBox(width: 15,),
            Text('View Transactions'),
          ],
        ),
      ),
    ),
    GestureDetector(
      onTap: () {
        // Your existing onPressed logic for the Members button (or add new logic)
      },
      child: Container(
        padding: EdgeInsets.all(4),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.group),
            SizedBox(width: 15,),
            Text('View Members'),
          ],
        ),
      ),
    ),
  ],
),

              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: [
               
                SizedBox(height: 16.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          showRecordTransactionDialog(context);
                        },
                        child: Container(
                          height: 165,
                          width: 170,
                          decoration: BoxDecoration(
                             color: Color(0xFFBFC6CB),
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text('Jangi Meet', style: TextStyle(color: Colors.white),),
                                    Icon(Icons.info, color: Colors.white,),
                                     
                                  ],
                                ),
                               SizedBox(height: 8,),
                                Text(
                                  'Record a Transaction',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 27, fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text('', style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8,),
                     
                      
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Text(
                  'Recent Transactions',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
          ),
          Expanded(
             child: Container(
              padding: EdgeInsets.all(16),
               child: ListView(
                children: [
               
                  TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),
                    TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),
                    TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),
                    TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),
                    TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),
                    TransactionTile(
                      date: '26 October 2024',
                      description: 'D3man\'s Birthday',
                      amount: '+ 250,000',
                    ),]),
             ),
           )
        ],
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