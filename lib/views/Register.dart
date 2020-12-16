import 'package:flutter/material.dart';
import 'package:flutterstarter/provider/RegisterProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';

import 'BaseView.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterProvider>(
      onModelReady: (model)=>model.getLokasi(),
      builder: (context, provider, child){
        return  Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                            width: double.infinity,
                            child: Image.asset('assets/images/vector-login.png', fit: BoxFit.fitWidth,)
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 60, left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                    onTap: (){
                                      Navigator.pop(context);
                                    },
                                    child: Icon(Icons.arrow_back, color: Colors.white,)
                                ),
                                SizedBox(height: 16,),
                                Text("Register Akun", style: textHeader,),
                                SizedBox(height: 16,),
                              ],
                            )
                        )
                      ],
                    ),

                    Container(
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.only(top: 32),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (value){
                                if(value == ''){
                                  return 'username tidak boleh kosong';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Username"
                              ),
                            ),
                            SizedBox(height: 16,),
                            TextFormField(
                              validator: (value){
                                if(value == ''){
                                  return 'alamat email tidak boleh kosong';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Alamat Email"
                              ),
                            ),
                            SizedBox(height: 16,),
                            TextFormField(
                              obscureText: true,
                              validator: (value){
                                if(value == ''){
                                  return 'password tidak boleh kosong';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Password"
                              ),
                            ),
                            SizedBox(height: 32,),
                            SizedBox(
                              width: double.infinity,
                              child: RaisedButton(
                                color: Colors.blueAccent,
                                padding: EdgeInsets.all(16),
                                onPressed: (){
                                  assert(formKey.currentState.validate());
                                },
                                child: Text("Register", style: TextStyle(color: Colors.white),),
                              ),
                            ),

                            SizedBox(height: 16,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Sudah memiliki akun ?"),
                                InkWell(
                                  child: Text("Login", style: TextStyle(decoration: TextDecoration.underline),),
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                )
                              ],
                            ),

                            SizedBox(height: 32,),
                            Text("Posisi saat ini:"),
                            Text("Longitude : "+provider.lokasiLongitude),
                            Text("Latitude : "+provider.lokasiLatitude),

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
        );
      },
    );


  }
}
