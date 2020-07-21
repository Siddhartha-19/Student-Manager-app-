import 'package:flutter/material.dart';
import 'package:project_sm/Screenroute/Authenticate/Auth.dart';
import 'package:project_sm/Screenroute/Authenticate/Sign-in.dart';
import 'package:project_sm/Screenroute/Home/Home.dart';
import 'package:provider/provider.dart';
import 'package:project_sm/ModelUser/user.dart';
//import 'package:project_sm/Screenroute/Home/Home.dart';
class Checkin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user=Provider.of<User>(context);
    //print(user);
    if(user==null)
    {
    return Authenticate();
      }
    else{
      return Home();
    }
  }
}