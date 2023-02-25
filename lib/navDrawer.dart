import 'package:bmi/privacy_policy.dart';
import 'package:bmi/terms.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              '',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/bmi.png'))),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () => {
            showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
            title: const Text('BMI CALCULATOR', style: TextStyle(color: Colors.green),),
            content: const Text('BMI between 18 - 25,\nYour weight is Ok, You are Healthy \n\n'
            'BMI below 18,\nYour weight is less than normal, You should gain weight \n\n'
            'BMI above 25,\nYour weight is more than normal, You should gain weight'),
            actions: <Widget>[
            TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
            ),
            ],
            ),
            ),
            },
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Privacy_Policy(),))},
          ),
          ListTile(
            leading: Icon(Icons.handshake),
            title: Text('Terms & Conditions'),
            onTap: () => {Navigator.push(context, MaterialPageRoute(builder: (context) => Terms_Conditions(),))},
          ),
        ],
      ),
    );
  }
}