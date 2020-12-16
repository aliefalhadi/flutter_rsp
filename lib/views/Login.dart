import 'package:flutter/material.dart';
import 'package:flutterstarter/provider/LoginProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:geolocator/geolocator.dart';

import 'BaseView.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    getLokasi();
    super.initState();
  }
  Future getLokasi ()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginProvider>(
      onModelReady: (model) => model.getLokasi(),
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
                            margin: EdgeInsets.only(top: 70, left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Selamat Datang,", style: textHeader,),
                                SizedBox(height: 16,),
                                Text("Silahkan Login", style: textHeader.copyWith(fontWeight: FontWeight.bold, fontSize: 32),),
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
                                  return 'alamat email tidak boleh kosong';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  labelText: "Alamat email"
                              ),
                            ),
                            SizedBox(height: 16,),
                            TextFormField(
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
                                child: Text("Login", style: TextStyle(color: Colors.white),),
                              ),
                            ),

                            SizedBox(height: 16,),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Belum memiliki akun ?"),
                                InkWell(
                                  child: Text("Register", style: TextStyle(decoration: TextDecoration.underline),),
                                  onTap: (){
                                    Navigator.pushNamed(context, '/register');
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
