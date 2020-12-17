import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterstarter/provider/RegisterProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:image_picker/image_picker.dart';

import '../shareds/ViewState.dart';
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
      onModelReady: (model) => model.getLokasi(),
      builder: (context, provider, child) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Container(
              child: ListView(
                children: [
                  Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/vector-login.png',
                            fit: BoxFit.fitWidth,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 60, left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  )),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Register Akun",
                                style: textHeader,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                            ],
                          ))
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.only(top: 32),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            validator: (value) {
                              if (value == '') {
                                return 'username tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: "Username"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text("Foto Profile"),
                          SizedBox(
                            height: 8,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                        title:
                                            new Text("Tambah foto"),
                                        content: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              ListTile(
                                                onTap: () {
                                                  Navigator.pop(context);

                                                  provider.getImageFile(
                                                      ImageSource.camera);
                                                },
                                                leading:
                                                    Icon(Icons.camera_alt),
                                                title:
                                                    Text("Ambil dari Kamera"),
                                              ),
                                              ListTile(
                                                onTap: () {
                                                  Navigator.pop(context);

                                                  provider.getImageFile(
                                                      ImageSource.gallery);
                                                },
                                                leading: Icon(Icons.image),
                                                title:
                                                    Text("Pilih dari Galeri"),
                                              )
                                            ],
                                          ),
                                        ));
                                  });
                            },
                            child: Container(
                              color: Colors.grey,
                              height: 300,
                              child: provider.foto == '' ? Center(
                                child: Icon(Icons.camera_alt),
                              )
                              :
                              Center(child: Image.file(File(provider.foto)))
                              ,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            onChanged: (value){
                              provider.alamatEmail = value;
                            },
                            validator: (value) {
                              if (value == '') {
                                return 'alamat email tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: "Alamat Email"),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (value) {
                              if (value == '') {
                                return 'password tidak boleh kosong';
                              }
                              return null;
                            },
                            decoration:
                                InputDecoration(labelText: "Password"),
                          ),
                          SizedBox(
                            height: 32,
                          ),
                         provider.state == ViewState.Fetching ? CircularProgressIndicator() : SizedBox(
                            width: double.infinity,
                            child: RaisedButton(
                              color: Colors.blueAccent,
                              padding: EdgeInsets.all(16),
                              onPressed: () async{
                                FocusScope.of(context).unfocus();
                                if(formKey.currentState.validate()){
                                  bool res = await provider.register();
                                  if(res){
                                    showDialog(
                                      barrierDismissible: false,
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                "Selamat anda berhasil register, silahkan login."),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }else{
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                "anda telah login menggunakan username : email sebanyak 12 kali"),
                                            actions: <Widget>[
                                              FlatButton(
                                                child: Text("OK"),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                              )
                                            ],
                                          );
                                        });
                                  }
                                }
                              },
                              child: Text(
                                "Register",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sudah memiliki akun ?"),
                              InkWell(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          Text("Posisi saat ini:"),
                          Text("Longitude : " + provider.lokasiLongitude),
                          Text("Latitude : " + provider.lokasiLatitude),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
