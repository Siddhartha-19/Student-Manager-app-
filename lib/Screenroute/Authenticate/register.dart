import 'package:flutter/material.dart';
import 'package:project_sm/A-Service/s-auth.dart';
import 'package:project_sm/Loadpart/Loading.dart';
class Register extends StatefulWidget {
  final Function scheck;
  Register({this.scheck});
  
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register > {
  ServiceAuth _auth=ServiceAuth();
  final _formkey=GlobalKey<FormState>();
   
  String email='';
  String password='';
  String error='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading?Loader():MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Register to SM'),
        actions: <Widget>[
          FlatButton.icon(onPressed:(){
            widget.scheck();
          }, icon: Icon(Icons.person) ,label:Text('SignIn'),
          ),
        ],
      ),
      
        //backgroundColor: Colors.red,
        body:Center(
        child:Container(
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email address',
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
                  validator: (val) => val.isEmpty?'Enter an email':null,
                  onChanged :(val) {
                  setState(() {
                  email=val;  
                  });
                  },
                ),
                  SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'password',
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
                  validator: (val) => val.length<8?'Enter the password of 8+':null,
                  obscureText: true,
                  onChanged :(val) {
                    setState(() {
                      password=val;
                    });

                  },
                ), 
                SizedBox(height: 20,),
                RaisedButton(
                  onPressed:() async{
                    if(_formkey.currentState.validate())
                    { 
                      setState(() {
                        loading=true;
                      });
                     dynamic result=await _auth.registerwithemailpassword(email, password);
                     if(result==null)
                     {
                      
                       setState(() {
                         error='please give the valid email and password';
                          loading=false;
                       });
                     }
                    }
                  } ,
                  child: Text('register')
                   ),
                   SizedBox(height:20),
                   Text(error,
                   style: TextStyle(
                     fontSize: 20,
                     color: Colors.red,
                   ),
                   )

              ],
            ),
      
        ),  
       ),
    
    )
    )
    );
  }
}