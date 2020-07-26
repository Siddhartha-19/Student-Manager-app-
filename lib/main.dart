import 'package:flutter/material.dart';
import 'package:project_sm/A-Service/s-auth.dart';
import 'package:project_sm/Screenroute/check-in.dart';
import 'package:provider/provider.dart';
import 'package:project_sm/ModelUser/user.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';
import 'package:flutter/services.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Quick(),
    );
  }
}
class Quick extends StatefulWidget {
  @override
  _QuickState createState() => _QuickState();
}

class _QuickState extends State<Quick> {

ConnectivityResult previous;

  @override
  void initState(){
    super.initState();
    try {
      InternetAddress.lookup('google.com').then((result){
        if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
          // internet conn available
          //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
            //Checkin(),
          //));
        }else{
          
          _showdialog();
        }
      }).catchError((error){
       
        _showdialog();
      });
    } on SocketException catch (_){
      // no internet
      _showdialog();
    }


    Connectivity().onConnectivityChanged.listen((ConnectivityResult connresult){
      if(connresult == ConnectivityResult.none){

      }else if(previous == ConnectivityResult.none){
        // internet conn
       // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => 
            //Checkin(),
         // ));
      }

      previous = connresult;
    });



  }


  void _showdialog(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ERROR'),
        content: Text("No Internet Detected."),
        actions: <Widget>[
          FlatButton(
           
            onPressed: () => exit(0) ,
            //SystemChannels.platform.invokeMethod('Systemnavigator.pop'),
            child: Text("Exit"),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:ServiceAuth().user, 
    child :MaterialApp(
     home: Checkin()
    )
  );
  }
}
