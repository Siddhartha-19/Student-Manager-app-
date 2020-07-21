import 'package:flutter/material.dart';
import 'package:project_sm/A-Service/Database.dart';
import 'package:project_sm/Loadpart/Loading.dart';
import 'package:project_sm/ModelUser/user.dart';
import 'package:provider/provider.dart';
class Settingvalues extends StatefulWidget {
  @override
  _SettingvaluesState createState() => _SettingvaluesState();
}

class _SettingvaluesState extends State<Settingvalues> {
  final _formkey=GlobalKey<FormState>();
  String curname;
  String curattendance;
  String curassignments;
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    return StreamBuilder<Userdata>(
      stream: Servicedatabase(uid:user.uid).userdata,
      builder: (context, snapshot) {
        if(snapshot.hasData)
         {
           Userdata userdata=snapshot.data;
             return Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Text('Enter the data'),
                  SizedBox(height:20),
                  TextFormField(

                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Name',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width:2 
                              )

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,width:2
                              )
                            )
                          ),
                          validator: (val) => val.isEmpty?'Enter the Name':null,
                      
                          onChanged :(val) {
                            setState(() {
                            curname=val;
                            });

                          },
                        ),
                        SizedBox(height:20),
                  TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Attendance',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width:2 
                              )

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,width:2
                              )
                            )
                          ),
                          validator: (val) => val.isEmpty?'Enter the Attendance':null,
                         
                          onChanged :(val) {
                            setState(() {
                            curattendance=val;
                            });

                          },
                        ),
                        SizedBox(height:20),
                  TextFormField(
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            labelText: 'Assignments',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white, width:2 
                              )

                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,width:2
                              )
                            )
                          ),
                          validator: (val) => val.isEmpty?'Enter the Assignment':null,
                        
                          onChanged :(val) {
                            setState(() {
                            curassignments=val;
                            });

                          },
                        ),

                          SizedBox(height: 20,),
                        RaisedButton(
                          onPressed:() async{
                            if(_formkey.currentState.validate())
                            {
                             await Servicedatabase(uid: user.uid).updateuserdatabase(curname ?? userdata.name,
                              curattendance ?? userdata.attendance,
                              curassignments ?? userdata.assignments
                             );
                             Navigator.pop(context);
                              
                            }
                          },
                          child: Text('GiveValues'),
                          ),
                ],
              ),
              
            );
        }
        else
        {
         return Loader();
        }
       
      }
    );
  }
}
