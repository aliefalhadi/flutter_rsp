import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/views/BaseView.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light));
    return  BaseView<HomeProvider>(
      onModelReady: (model) => model.main(),
      builder: (context, provider, child){
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text("Refactori.id"),
          ),
          body: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
                  color: colorPrimary,
                  child: Column(
                    children: [
                      Text("Empowering People",style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white)),
                      Text("Through Programming", style: Theme.of(context).textTheme.headline5.copyWith(color: Colors.white)),
                      SizedBox(height: 32,),
                      Text(
                        "Refactory adalah perusahaan edukasi dan teknologi yang menyediakan layanan lengkap berupa course maupun custom training yang materinya dapat disesuaikan dengan kebutuhan teknologi dan bisnis perusahaan Anda.",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 32,),
                      RaisedButton(
                        onPressed: (){},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text("Temukan Solusi Anda",
                          style: TextStyle(color: Colors.white),),
                        color: Colors.orange,
                      ),
                      SizedBox(height: 8,),
                      OutlineButton(
                        onPressed: (){},
                        borderSide: BorderSide(
                            color: Colors.orange
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text("Temukan Solusi Anda",
                          style: TextStyle(color: Colors.white),),
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text("PARTNER EKSKLUSIF KAMI", style: TextStyle(color: Colors.white),),
                      SizedBox(height: 16,),
                      Container(
                        height: 100,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: provider.dataPartnerModel == null ? [ Center(child: CircularProgressIndicator(),) ] :
                              List.generate(provider.dataPartnerModel.data.length, (index) => Container(
                                width: 150,
                                child: Image.network("${provider.dataPartnerModel.data[index].photoUrl}"),
                              ),)
                        ),
                      )
                    ],
                  ),
                ),

                Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    children: [
                      Text("Apa Yang Refactory Dapat Bantu?",style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 16,),
                      Container(
                        child: Column(
                          children: [
                            Image.network('https://i1.wp.com/refactory.id/wp-content/uploads/2020/01/material_approval.png?fit=50%2C48&ssl=1'),
                            SizedBox(height: 16,),
                            Text(
                              "Memperkuat Tim Engineer Anda",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 8,),
                            Text(
                                "Bisnis di jaman modern membutuhkan keterampilan pengembangan terbaik untuk meningkatkan skala produk. Kami dapat mempersiapkan course dan juga dapat menyediakan tim yang menangani kebutuhan digital Anda.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32,),
                      Container(
                        child: Column(
                          children: [
                            Image.network('https://i2.wp.com/refactory.id/wp-content/uploads/2020/01/material_bolt.png?fit=28%2C48&ssl=1'),
                            SizedBox(height: 16,),
                            Text(
                                "Memperkuat Tim Engineer Anda",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(height: 8,),
                            Text(
                              "Bisnis di jaman modern membutuhkan keterampilan pengembangan terbaik untuk meningkatkan skala produk. Kami dapat mempersiapkan course dan juga dapat menyediakan tim yang menangani kebutuhan digital Anda.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    children: [
                      Text("AS SEEN ON",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white)),
                      SizedBox(height: 16,),
                      Container(
                        child: Column(
                            children: provider.dataAsSeenOnModel == null ?[] :
                            List.generate(provider.dataAsSeenOnModel.data.length, (index) => Container(
                              child: Image.network("${provider.dataAsSeenOnModel.data[index].photoUrl}"),
                            ),)
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );


  }
}
