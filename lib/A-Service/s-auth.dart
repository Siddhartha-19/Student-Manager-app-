import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_sm/A-Service/Database.dart';
import 'package:project_sm/ModelUser/user.dart';

class ServiceAuth{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  // sign-in guest
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user !=null ? User(uid:user.uid):null;
  }
  Stream<User> get user
  {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);

  }
    Future signinguest() async{
      try{
        AuthResult result = await _auth.signInAnonymously();  
        FirebaseUser user=result.user;
        return user;     
         }
        catch(e){
      print('.toString()');  
      return null;  
    }
      }
      // sign -in email
       Future signinwithemailpassword(String email,String password) async
      {
        try{
          AuthResult result=await _auth.signInWithEmailAndPassword(email: email, password: password);
          FirebaseUser user=result.user;
          return _userFromFirebaseUser(user);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }

      }
      //register
      Future registerwithemailpassword(String email,String password) async
      {
        try{
          AuthResult result=await _auth.createUserWithEmailAndPassword(email: email, password: password);
          FirebaseUser user=result.user;
          await Servicedatabase(uid: user.uid).updateuserdatabase('newstudent','0','NO');
          return _userFromFirebaseUser(user);
        }
        catch(e)
        {
          print(e.toString());
          return null;
        }

      }
      //signout
      Future signout() async
      {
        try{
        return await _auth.signOut();
        }
        catch(e)
        {
          print('e.tostring()');
          return null;
        }
      }
}