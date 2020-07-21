import 'package:flutter/material.dart';
import 'package:project_sm/ModelUser/student.dart';
class StudentTile extends StatelessWidget {
    final Student student;
  @override
  StudentTile({this.student});
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top:8),
      child:Card(
       margin: EdgeInsets.fromLTRB(20,0,20,20),
       child: ListTile(
         leading:Text(student.attendance),
         title: Text(student.name),
         subtitle: Text(student.assignments),
         ),
       ),
      );    
  }
}