import 'package:admin_jangi/style.dart';
import 'package:flutter/material.dart';
import 'package:admin_jangi/style.dart';



class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Your Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);// Add back button functionality
          },
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 50, color: Colors.grey[700]),
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  'Ngwa Phineahas',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildProfileField(
                context,
                label: 'Your name',
                value: 'Admin',
                
              ),
              _buildProfileField(
                context,
                label: 'Your Phone Number',
                value: '+237 679 575 852',
                
              ),
              _buildProfileField(
                context,
                label: 'Personal Identification Number',
                value: '#12AB23CD',
                
              ),
              _buildProfileField(
                context,
                label: 'Your language',
                value: 'English',
                
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primaryColor
              ),
              child: TextButton(onPressed: (){
                
    
              }, child: Text('Save',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white,
              fontSize: 11),))),
                  SizedBox(width: 16),
                  Container(
              width: 140,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: primaryColor, width: 2)
              ),
              child: TextButton(onPressed: (){
                
    
              }, child: Text('Discard',
              style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor,
              fontSize: 11),)))
                ],
              ),
              SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Add logout functionality
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(BuildContext context, {required String label, required String value, }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label),
                SizedBox(height: 4),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: value,
                    hintStyle: TextStyle(color: primaryColor),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
