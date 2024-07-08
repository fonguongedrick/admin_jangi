import 'package:admin_jangi/style.dart';
import 'package:flutter/material.dart';

class LoanDetailsScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {'date':'01-07-2034','amount': '50000', 'loanReturn':'31000', 'interest':'2000', 'duedate':'31-07-2024', },
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back), ),
        // title: Text(
        //   'Pa Ngwa, wan make sure say e money dey fine',
        //   style: TextStyle(color: Colors.brown),
        // ),
        
        // actions: [
        //   IconButton(
        //     icon: Icon(Icons.notifications, color: Colors.brown),
        //     onPressed: () {
        //       // Add notification button functionality
        //     },
        //   ),
        // ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             GestureDetector(
                onTap: () {
                 
                },
                child: Container(
                  height: 120,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                            color: Color(0xFF1C2B35),
                    
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(''),
                      Text(
                        'Ma Ashu Debt Details ',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info, color: Colors.white)),
                    
                    ],
                )),
              ),
              SizedBox(height: 5,),
            TableHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return LoanDetailsItem(
                    date: data[index]['date']!,
                    amount: data[index]['amount']!,
                    loanReturn: data[index]['loanReturn']!,
                    interest: data[index]['interest']!,
                    duedate: data[index]['duedate']!,

                    
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(onPressed: (){
                
      }, icon: Icon(Icons.add)),

    );
  }
}

class TableHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Date',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Loan Return/Interest',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Due Date',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }
}

class LoanDetailsItem extends StatelessWidget {
  final String date;
  final String amount;
  final String loanReturn;
  final String interest;
  final String duedate;
  
  LoanDetailsItem({required this.date, required this.amount, required this.loanReturn, required this.interest, required this.duedate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Text(date),
              ),
              Expanded(
                flex: 3,
                child: Text(amount),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(loanReturn),
                    Text(interest),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(duedate),
              ),
              
              
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context,String currentDate, String currentAmount, String currentLoanReturn, String currentInterest, String currentDueDate) {
    TextEditingController hostNoController = TextEditingController(text: currentAmount);
    TextEditingController nameController = TextEditingController(text: currentDate);
    TextEditingController phoneController = TextEditingController(text: currentLoanReturn);
    TextEditingController interestController = TextEditingController(text: currentInterest);
    TextEditingController locationController = TextEditingController(text: currentDueDate);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Amount'),
              TextField(
                controller: hostNoController,
                decoration: InputDecoration(
                  hintText: 'Enter New Amount',
                ),
              ),
              SizedBox(height: 10),
              Text('Date'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter Date',
                ),
              ),
              SizedBox(height: 10),
              Text('Loan Return'),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(
                  hintText: 'Enter Loan Return',
                ),
              ),
              SizedBox(height: 10),
              Text('Interest'),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'Enter interest',
                ),
              ),
              SizedBox(height: 10),
              Text('Due Date'),
              TextField(
                controller: locationController,
                decoration: InputDecoration(
                  hintText: 'Enter due date',
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Delete User'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update data based on edited values
                // For example, update the data list here
                // Assuming you have a method to update data:
                // updateUserData(nameController.text, phoneController.text, locationController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
//   void updateUserData(String newName, String newPhone, String newLocation) {
//     // Update the data list or any backend storage with the new values
//     // This depends on how your data management is set up
//     // For demonstration, let's assume updating the data list directly
//     // Find the index of the current item in the list
//     int index = data.indexWhere((element) => element['name'] == name && element['phone'] == phone && element['location'] == location);
//     if (index != -1) {
//       // Update the item in the data list
//       data[index]['name'] = newName;
//       data[index]['phone'] = newPhone;
//       data[index]['location'] = newLocation;
//     }
//   }
// }
