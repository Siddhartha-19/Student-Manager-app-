import 'package:flutter/material.dart';
import 'package:project_sm/A-Service/s-auth.dart';
import 'package:project_sm/Screenroute/check-in.dart';
import 'package:provider/provider.dart';
import 'package:project_sm/ModelUser/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:ServiceAuth().user, 
    child :MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Checkin()
    )
  );
  }
}
