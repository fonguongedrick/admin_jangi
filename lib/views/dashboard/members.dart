import 'package:admin_jangi/style.dart';
import 'package:flutter/material.dart';

class StatusListScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {'hostNo':'1','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'2','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'3','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'4','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bambui'},
    {'hostNo':'5','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'6','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'7','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'8','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'9','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
    {'hostNo':'10','name': 'Fon Achenui', 'phone':'677907834', 'location':'Bamenda'},
  ];

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
                  showDialog(
      context: context,
      builder: (BuildContext context) {
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
                    'Create New User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 32),
                Text('Your Name'),
                SizedBox(height: 5,),
                TextField(
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
                Text('Your Phone Number'),
                SizedBox(height: 5,),
                TextField(
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
                Text('Personal identification Number'),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter New User Id',
                    filled: true,
                    fillColor: Color(0xFFD9D9D9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Save action
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
        );
      },
    );
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
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return StatusListItem(
                    hostNo: data[index]['hostNo']!,
                    name: data[index]['name']!,
                    phone: data[index]['phone']!,
                    location: data[index]['location']!,
                    
                  );
                },
              ),
            ),
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
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Name / Phone',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Location',
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.brown),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  'Edit',
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

class StatusListItem extends StatelessWidget {
  final String hostNo;
  final String name;
  final String location;
  final String phone;
  
  StatusListItem({required this.name, required this.hostNo, required this.location, required this.phone});

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
                  icon: Icon(Icons.edit, color: Color(0xFF1C2B35)),
                  onPressed: () {
                    _showEditDialog(context,hostNo, name, phone, location);
                  },
                ),
              ),
            ],
          ),
          Divider()
        ],
      ),
    );
  }

  void _showEditDialog(BuildContext context,String currentHostNo, String currentName, String currentPhone, String currentLocation) {
    TextEditingController hostNoController = TextEditingController(text: currentHostNo);
    TextEditingController nameController = TextEditingController(text: currentName);
    TextEditingController phoneController = TextEditingController(text: currentPhone);
    TextEditingController locationController = TextEditingController(text: currentLocation);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit User Details'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Host Number'),
              TextField(
                controller: hostNoController,
                decoration: InputDecoration(
                  hintText: 'Enter New Host Number',
                ),
              ),
              SizedBox(height: 10),
              Text('Name'),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: 'Enter User name',
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
