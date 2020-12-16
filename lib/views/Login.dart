import 'package:flutter/material.dart';
import 'package:flutterstarter/shareds/Theme.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Alamat email"
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password"
                    ),
                  ),
                  SizedBox(height: 32,),
                  SizedBox(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.all(16),
                        onPressed: (){},
                      child: Text("Login"),
                        ),
                  )

                ],
              ),
            )
          ],
        ),
      )
    );
  }
}
