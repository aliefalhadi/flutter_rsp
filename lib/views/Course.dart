import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterstarter/provider/CourseProvider.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/views/BaseView.dart';

class Course extends StatefulWidget {
  @override
  _CourseState createState() => _CourseState();
}

class _CourseState extends State<Course> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light));
    return BaseView<CourseProvider>(
      onModelReady: (model) => model.main(),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text("Course"),
          ),
          body: Container(
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(16, 32, 16, 32),
                  color: colorPrimary,
                  child: Column(
                    children: [
                      Text("Tingkatkan skill pemrograman",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white)),
                      Text("kapan pun, dimana pun.",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              .copyWith(color: Colors.white)),
                      SizedBox(
                        height: 32,
                      ),
                      Text(
                        "We’re a brand of passionate software engineers and educators with an engaging curriculum backed by real-world software projects ready to boost your career.",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          "Masuk & Mulai Belajar",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(color: Colors.orange),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          "Daftar Sekarang",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    children: [
                      Text(
                        "Bagaimana Refactory Course membantu meningkatkan skill anda.",
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        child: Text(
                          "Pelajari Lebih",
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.orange,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        child: Image.network(
                            "https://i0.wp.com/refactory.id/wp-content/uploads/2020/07/Frame.png?fit=839%2C481&ssl=1"),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: Column(
                    children: [
                      Text("MEET OUR GRADUATES",
                          style: TextStyle(color: Colors.white)),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Review",
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(color: Colors.white)),
                      SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(
                            text: "Read what our alumni said on ",
                            children: [
                              TextSpan(
                                  text: "Course Report",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                  child: provider.dataAlumniReportModel == null ? CircularProgressIndicator() : ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.dataAlumniReportModel.data.length,
                      itemBuilder: (context, index){
                        return  Column(
                          children: [
                            Card(
                              margin: EdgeInsets.zero,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Image.network(
                                      provider.dataAlumniReportModel.data[index].user.photoUrl,
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                      provider.dataAlumniReportModel.data[index].user.name,
                                            style: TextStyle(fontSize: 21),
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                              provider.dataAlumniReportModel.data[index].user.from,
                                            style:
                                            Theme.of(context).textTheme.caption,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          RatingBar.builder(
                                            initialRating: double.parse(provider.dataAlumniReportModel.data[index].star.toString()),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(
                                            provider.dataAlumniReportModel.data[index].title,
                                            style:
                                            Theme.of(context).textTheme.bodyText1,
                                          ),
                                          SizedBox(
                                            height: 16,
                                          ),
                                          Text(provider.dataAlumniReportModel.data[index].description),
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(height: 16,)
                          ],
                        );
                      }
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
