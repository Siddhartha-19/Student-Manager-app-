import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_sm/ModelUser/student.dart';
import 'package:project_sm/Screenroute/Home/Studenttile.dart';


class Studentlist extends StatefulWidget {
  @override
  _StudentlistState createState() => _StudentlistState();
}

class _StudentlistState extends State<Studentlist> {
  @override
  Widget build(BuildContext context) {
    final studentdata=Provider.of<List<Student>>(context)??[];
    
    return ListView.builder(
      itemCount:studentdata.length,
      itemBuilder:(context, index)
      {
        return StudentTile(student:studentdata[index]);
      },
      );
     
 
  }
}