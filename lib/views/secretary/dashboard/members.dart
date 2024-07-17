import 'package:admin_jangi/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class User {
  final int id;
  final String name;
  final String hostNo;
  final String phoneNumber;
  final String location;

  User({
    required this.id,
    required this.name,
    required this.hostNo,
    required this.phoneNumber,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      hostNo: json['host_number'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      location: json['location'] ?? '',
    );
  }
}

 

class SecretaryMembers extends StatefulWidget {
  @override
  State<SecretaryMembers> createState() => _SecretaryMembersState();
}

class _SecretaryMembersState extends State<SecretaryMembers> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchUserNames();
  }

  Future<void> fetchUserNames() async {
  final response = await http.get(
    Uri.parse('https://814f-102-244-155-214.ngrok-free.app/api/users'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> usersJson = jsonDecode(response.body);
    List<User> fetchedUsers = usersJson.map((json) => User.fromJson(json)).toList();

    setState(() {
      users = fetchedUsers;
    });
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to fetch user names')),
    );
  }
}


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
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
             
              SizedBox(height: 5,),
            TableHeader(),
            Expanded(
              child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return StatusListItem(
                    hostNo: user.hostNo,
                    name: user.name,
                    phone: user.phoneNumber,
                    location: user.location,
                    
                  );
                },
              ),)
          ],
        ),
      ),
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
                  'Host No',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Name / Phone',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Edit',
                  style: TextStyle(fontWeight: FontWeight.bold),
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

class StatusListItem extends StatelessWidget {
  final String hostNo;
  final String name;
  final String phone;
  final String location;
  

  StatusListItem({
    required this.hostNo,
    required this.name,
    required this.phone,
    required this.location,
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(hostNo),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name),
                Text(phone),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(location),
          ),
          
        ],
      ),
    );
  }
}
