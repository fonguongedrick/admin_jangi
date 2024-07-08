import 'package:admin_jangi/views/dashboard/loanDetails.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';
import 'package:admin_jangi/views/dashboard/loanRequest.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'package:permission_handler/permission_handler.dart';
import 'package:external_path/external_path.dart';
class Sinkingfunds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sinking Funds',style: TextStyle(fontSize: 32,color: primaryColor),),
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
                      
                      Text(
                        'Balance',
                        style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w600),
                      ),
                      Text('100,000 XAF',style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600),),
                      Spacer(),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.info, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              Expanded(
                child: ListView(
                  children: [
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Akonui Marcel',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Ngu Taniform',
                      amount: '+ 300, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Joy Chia',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Nfor Jato',
                      amount: '+ 300, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '04 April 2024',
                      description: 'Kinyuy Ndoh',
                      amount: '+ 250, 000',
                      amountColor: Colors.green,
                    ),
                    TransactionTile(
                      date: '03 April 2024',
                      description: 'Fon Celine',
                      amount: '+ 300, 000',
                      amountColor: Colors.green,
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
  class TransactionsDetail extends StatelessWidget {
  final List<Map<String, String>> ContributionData = [
    {'name': '07-07-2024', 'amount': '10,000 XAF'},
    {'name': '05-07-2024', 'amount': '10,000 XAF'},
    {'name': '04-07-2024', 'amount': '10,000 XAF'},
    {'name': '03-07-2024', 'amount': '10,000 XAF'},
    {'name': '02-07-2024', 'amount': '10,000 XAF'},
    {'name': '01-07-2024', 'amount': '10,000 XAF'},
  ];

 

  Future<void> _generateAndSavePDF(BuildContext context) async {
    final status = await Permission.storage.request();

    switch (status) {
      case PermissionStatus.granted:
        // Get the Downloads directory (adjust if needed)
        final directory = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
          print('Directory path: $directory');
        if (directory == null) {
          // Handle case where Downloads directory is unavailable
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Failed to access Downloads directory'),
            ),
          );
          return;
        }

        // Create the PDF file within the directory
        //final file = File('${directory.path}/contribution_list.pdf');


        try {
          final pdf = pw.Document();

          pdf.addPage(
            pw.Page(
              build: (pw.Context context) => pw.Center(
                child: pw.Column(
                  children: [
                    pw.Text('Contribution List', style: pw.TextStyle(fontSize: 24)),
                    pw.SizedBox(height: 20),
                    pw.Table.fromTextArray(
                      headers: ['Name', 'Amount'],
                      data: ContributionData.map((item) {
                        return [item['name'], item['amount']];
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );

          
        } catch (error) {
          // Handle potential errors during PDF creation or saving
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving PDF: $error')),
          );
        }
        break;
      case PermissionStatus.denied:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Storage permission is required to save the PDF.'),
            action: SnackBarAction(
              label: 'Retry',
              onPressed: () async {
                await Permission.storage.request();
              },
            ),
          ),
        );
        break;
      case PermissionStatus.permanentlyDenied:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Storage permission is permanently denied. You can grant permission from the app settings.',
            ),
            action: SnackBarAction(
              label: 'Settings',
              onPressed: () async {
                await openAppSettings();
              },
            ),
          ),
        );
        break;
      case PermissionStatus.restricted:
        // Handle restricted permission case (rare)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Storage permission restricted')),
        );
        break;
      default:
        // Handle other unexpected permission states
        break;
    }
  }

  // ... your existing code for TransactionsDetail ...


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Akonui Marcel',
          style: TextStyle(color: primaryColor),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: primaryColor),
          onPressed: () {
            Navigator.pop(context); // Add back button functionality
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ContributionTableHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: ContributionData.length,
                itemBuilder: (context, index) {
                  return ContributionListItem(
                    name: ContributionData[index]['name']!,
                    amount: ContributionData[index]['amount']!,
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _generateAndSavePDF(context);
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      _generateAndSavePDF(context);
                    },
                    child: Text(
                      'Download',
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
          ],
        ),
      ),
    );
  }
}

class ContributionTableHeader extends StatelessWidget {
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
                  'Name',
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Amount',
                  style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}

class ContributionListItem extends StatelessWidget {
  final String name;
  final String amount;

  ContributionListItem({required this.name, required this.amount});

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
                child: Text(name),
              ),
              Expanded(
                flex: 2,
                child: Text(amount),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
