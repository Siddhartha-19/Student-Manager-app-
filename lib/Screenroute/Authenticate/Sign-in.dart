import 'package:flutter/material.dart';
import 'package:project_sm/A-Service/s-auth.dart';
import 'package:project_sm/Loadpart/Loading.dart';

class Signin extends StatefulWidget {
  final Function scheck;
  Signin({this.scheck});
  @override
  _Signintate createState() => _Signintate();
}

class _Signintate extends State<Signin> {
  ServiceAuth _auth=ServiceAuth();
  final _formkey=GlobalKey<FormState>();
   String email='';
   String password='';
   String error='';
   bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading?Loader(): MaterialApp(
      debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: Text('Sign-in to SM'),
        actions: <Widget>[
          FlatButton.icon(onPressed:(){
            widget.scheck();
          }, icon: Icon(Icons.person) ,label:Text('Register'),
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
                SizedBox(height: 20),
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
                       dynamic result = await _auth.signinwithemailpassword(email, password);
                       if(result==null)
                       {
                         setState(() {
                           error='Please enter valid email or password';
                           loading=false;
                         });
                       }
                    }
                  } ,
                  child: Text('SignIn')
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
      /*   Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children :<Widget>[
            
            Padding(
              padding:EdgeInsets.all(30),
            child : MaterialButton(
              onPressed:() async{
                 dynamic result =await _auth.signinguest();
                     if(result==null)
                     {
                       print('Error signing in');
                     }     
                     else{
                       print(result.uid);
                     }
                          },
              color: Colors.cyan[100],
               child: Text('SigninasGuest',
                             style: TextStyle(
                 fontSize: 25,
                 color: Colors.black,
                 fontWeight: FontWeight.w700,
                 
               ),
               )
               )
            ),
          ],
        ), */
        ),  
       ),
    
    )
    )
    );
  }
}