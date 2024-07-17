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

 

class StatusListScreen extends StatefulWidget {
  @override
  State<StatusListScreen> createState() => _StatusListScreenState();
}

class _StatusListScreenState extends State<StatusListScreen> {
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


  void _showCreateUserDialog(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController hostController = TextEditingController();
    final TextEditingController locationController = TextEditingController();
    String? userType;

    Future<void> _submitDetails() async {
      final String name = nameController.text;
      final String phone = phoneController.text;
     int? host = int.tryParse(hostController.text);

      final String location = locationController.text;

      if (name.isEmpty || phone.isEmpty || location.isEmpty || userType == null) {
        // Handle the case where some fields are not filled
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all the fields')),
        );
        return;
      }

      final response = await http.post(
        Uri.parse('https://814f-102-244-155-214.ngrok-free.app/api/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'phone_number': phone,
          'host_number': host.toString(),
          'location': location,
          'type': userType!,
        }),
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        // If the server returns a 200 OK response, show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('User created successfully!')),
        );
      } else {
        // If the server did not return a 200 OK response, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create user')),
        );
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Create New User',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 32),
                  Text('Your Name'),
                  SizedBox(height: 5),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter User name',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Phone Number'),
                  SizedBox(height: 5),
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      hintText: 'Enter Phone Number',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Host Number'),
                  SizedBox(height: 5),
                  TextField(
                    controller: hostController,
                    decoration: InputDecoration(
                      hintText: 'Enter Host Number',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('Location'),
                  SizedBox(height: 5),
                  TextField(
                    controller: locationController,
                    decoration: InputDecoration(
                      hintText: 'Enter Location',
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text('User Type'),
                  SizedBox(height: 5),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFD9D9D9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    items: ['Admin', 'Secretary', 'User']
                        .map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      userType = newValue;
                    },
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await _submitDetails();
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 32.0),
                          decoration: BoxDecoration(
                            color: primaryColor,
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
          ),
        );
      },
    );}

  void _showEditDialog(BuildContext context, User user) {
  TextEditingController hostNoController = TextEditingController(text: user.hostNo);
  TextEditingController nameController = TextEditingController(text: user.name);
  TextEditingController phoneController = TextEditingController(text: user.phoneNumber);
  TextEditingController locationController = TextEditingController(text: user.location);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Edit User'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Host Number'),
            TextField(
              controller: hostNoController,
              decoration: InputDecoration(
                hintText: 'Enter Host Number',
              ),
            ),
            SizedBox(height: 10),
            Text('Name'),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter Name',
              ),
            ),
            SizedBox(height: 10),
            Text('Phone Number'),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
              ),
            ),
            SizedBox(height: 10),
            Text('Location'),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                hintText: 'Enter Location',
              ),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Implement your logic to delete the user
              
              Navigator.of(context).pop();
            },
            child: Text('Delete'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Update user data
              // setState(() {
              //   user.hostNo = hostNoController.text;
              //   user.name = nameController.text;
              //   user.phone = phoneController.text;
              //   user.location = locationController.text;
              // });
              Navigator.of(context).pop();
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
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
             GestureDetector(
                onTap: () {
                  
           _showCreateUserDialog(context);
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
                        'Create a new User',
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
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  return StatusListItem(
                    hostNo: user.hostNo,
                    name: user.name,
                    phone: user.phoneNumber,
                    location: user.location,
                    onTapEdit: () {
                      _showEditDialog(context, user);
                    },
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
  final VoidCallback onTapEdit;

  StatusListItem({
    required this.hostNo,
    required this.name,
    required this.phone,
    required this.location,
    required this.onTapEdit,
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
          Expanded(
            flex: 1,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: onTapEdit,
            ),
          ),
        ],
      ),
    );
  }
}
