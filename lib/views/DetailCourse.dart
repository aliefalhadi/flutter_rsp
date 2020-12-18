import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstarter/models/DetailCoursemodel.dart';
import 'package:flutterstarter/provider/DetailCourseProvider.dart';
import 'package:flutterstarter/provider/ListCourseProvider.dart';
import 'package:flutterstarter/shareds/Theme.dart';
import 'package:flutterstarter/shareds/ViewState.dart';
import 'package:flutterstarter/views/BaseView.dart';

class DetailCourse extends StatefulWidget {
  @override
  _DetailCourseState createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: colorPrimary,
        statusBarIconBrightness: Brightness.light));
    return BaseView<DetailCourseProvider>(
      onModelReady: (model) => model.main(),
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: colorPrimary,
          appBar: AppBar(
            backgroundColor: colorPrimary,
            title: Text("Detail Course"),
          ),
          body: provider.state == ViewState.Fetching
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.only(top: 32),
                            child: Text(
                              "HTML & CSS",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: Colors.white),
                            )),
                        Container(
                            height: 200,
                            child: Image.network(
                                provider.detailCourseModel.quistionPhoto)),
                        Container(
                          padding: EdgeInsets.all(16),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tentang Course",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(provider.detailCourseModel.shortDescription),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                provider.detailCourseModel.quistion,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(provider.detailCourseModel.answer),
                              SizedBox(
                                height: 32,
                              ),
                              Text(
                                "Materi Course",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(fontSize: 16),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemCount: provider
                                      .detailCourseModel.materiCourse.length,
                                  itemBuilder: (context, index) {
                                    MateriCourse materiCourse = provider
                                        .detailCourseModel.materiCourse[index];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(materiCourse.section),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemCount: materiCourse.data.length,
                                          itemBuilder: (context, index){
                                            Datum dataMateri = materiCourse.data[index];
                                            String nomorDataMateri = "0"+(index+1).toString();
                                            return ListTile(
                                              contentPadding: EdgeInsets.zero,
                                              leading: Text(
                                                nomorDataMateri,
                                                style: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 24),
                                              ),
                                              title: Text(dataMateri.title),
                                              subtitle: Text(dataMateri.timeIn),
                                              trailing: CircleAvatar(
                                                backgroundColor: colorPrimary,
                                                child: Icon(
                                                  Icons.play_arrow,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(height: 16,)
                                      ],
                                    );
                                  })
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
        );
      },
    );
  }
}
