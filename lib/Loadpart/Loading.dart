import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body:Center(
          child:Container(
          color :Colors.white,
          child:SpinKitHourGlass(color: Colors.blue),
        ),
        )
      ),

    );
  }
}