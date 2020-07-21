import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_sm/ModelUser/student.dart';
import 'package:project_sm/ModelUser/user.dart';

class Servicedatabase
{
  final String uid;
  Servicedatabase({this.uid});
  //List<String> subjects =new List();
  final CollectionReference sdetail=Firestore.instance.collection('studentdata');
  Future updateuserdatabase(String name,String attendance,String assignments)
  async{
    return await sdetail.document(uid).setData({
   'name':name,
   'attendance':attendance,
   'assignments':assignments,
    });
   }
   //Student model
   List<Student> _studentlistFormSnapshot(QuerySnapshot snapshot)
   {
     return snapshot.documents.map((doc){
      return Student(
        name: doc.data['name']??'',
        attendance:doc.data['attendance']??'',
        assignments:doc.data['assignments']??'',
      );
     }  ).toList();
   }
   //Data from database
   Userdata userdataFromSnapshot(DocumentSnapshot snapshot)
   {
     return Userdata(
       uid:uid,
       name: snapshot.data['name'],
       attendance: snapshot.data['attendance'],
       assignments: snapshot.data['assignments'],
        );
   }
   Stream<List<Student>> get studentdata
   {
    return sdetail.snapshots().map(_studentlistFormSnapshot);
   }
   //to get user data
   Stream<Userdata> get userdata
   {
     return sdetail.document(uid).snapshots().map(userdataFromSnapshot);
   } 
}