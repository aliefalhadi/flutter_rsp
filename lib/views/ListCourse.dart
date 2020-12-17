import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterstarter/provider/CourseProvider.dart';
import 'package:flutterstarter/provider/HomeProvider.dart';
import 'package:flutterstarter/provider/ListCourseProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/views/BaseView.dart';

class ListCourse extends StatefulWidget {
  @override
  _ListCourseState createState() => _ListCourseState();
}

class _ListCourseState extends State<ListCourse> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light));
    return BaseView<ListCourseProvider>(
      onModelReady: (model) => model.main(),
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text("List Course"),
          ),
          body: Container(
            padding: EdgeInsets.all(16),
            child: ListView(
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                      children: [
                        Text("Category: "),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            value: 'All',
                            items: <String>[
                              'All',
                              'Web Frontend (18)',
                              'Backend (6)',
                              'PHP (3)'
                            ].map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: new Text(value),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16,),
                Card(
                  margin: EdgeInsets.zero,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Find a course",
                      suffixIcon: IconButton(
                          onPressed: (){},
                        icon: Icon(Icons.search),
                      )
                    ),
                  ),
                ),
                SizedBox(height: 16,),

                Container(
                  child: provider.listCourseModel == null ? CircularProgressIndicator() : ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: provider.listCourseModel.data.length,
                      itemBuilder: (context, index){
                        if(provider.listCourseModel.data[index].linkUrl != null){
                          return  Column(
                            children: [
                              Card(
                                margin: EdgeInsets.zero,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Image.network(
                                        provider.listCourseModel.data[index].photoUrl,
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
                                              provider.listCourseModel.data[index].title,
                                              style: TextStyle(fontSize: 21),
                                            ),
                                            SizedBox(
                                              height: 16,
                                            ),

                                            SizedBox(
                                              height: 16,
                                            ),
                                            Text(provider.listCourseModel.data[index].shortDescription),
                                            SizedBox(
                                              height: 32,
                                            ),
                                            Row(
                                              children: [
                                                CircleAvatar(
                                                  backgroundImage: NetworkImage(provider.listCourseModel.data[index].user.photoUrl),
                                                ),
                                                SizedBox(width: 16,),
                                                Text(provider.listCourseModel.data[index].user.name)
                                              ],
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                              SizedBox(height: 16,)
                            ],
                          );
                        }
                        return Container();
                      }
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
