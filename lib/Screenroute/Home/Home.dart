import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' ;
import 'package:project_sm/A-Service/Database.dart';
import 'package:project_sm/A-Service/s-auth.dart';
import 'package:project_sm/Screenroute/Home/Settingvalues.dart';
import 'package:provider/provider.dart';
import 'package:project_sm/Screenroute/Home/studentlist.dart';
import 'package:project_sm/ModelUser/student.dart';

class Home extends StatelessWidget {

  final ServiceAuth _auth = ServiceAuth();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel() {
      showModalBottomSheet(context: context, builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child:Settingvalues(),
        );
      });
    }

    return StreamProvider<List<Student>>.value(
      value: Servicedatabase().studentdata,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
           leading: IconButton( 
           icon: Icon(Icons.menu), 
         onPressed:(){},
         ),
          title: Text('SM',
          style: TextStyle(
            color: Colors.black,
          ),),
          backgroundColor: Colors.cyan,
          elevation: 0.0,
         
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Sign-Out'),
              onPressed: () async {
                await _auth.signout();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.stars),
              label: Text('Give it'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
          body: Studentlist()
        ),
     
    );
  }
}