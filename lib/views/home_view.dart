import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_6/controllers/users_controller.dart';
import 'package:flutter_application_6/models/users_models.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  var userController = Get.find<UsersController>();
  HomeView({ Key? key }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  var dataList = <UsersModel>[];
  var title = "";
  var description = "";

  @override
  void initState(){
    getJsonData();
    super.initState();
  }

  getJsonData() async {
    var jsonData = await DefaultAssetBundle.of(context)
        .loadString("lib/jsons/app_main.json");
    var jsonResult = jsonDecode(jsonData);
    widget.userController.getData(jsonResult);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UsersController>(
      builder: (snapshot) {
        var title = snapshot.title;
        var description = snapshot.description;
        var dataList = snapshot.dataList;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '$title',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.blue,
            elevation: 1,
            iconTheme: IconThemeData(
              color: Colors.black, //change your color here
            ),
          ),
          body: SafeArea(child: dataList.isEmpty ? Center(child: CircularProgressIndicator()) : Column(
            children: [
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                  '$description',
                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height * 0.81,
                width: MediaQuery.of(context).size.width * 1.0,
                child: ListView.builder(
                itemCount: dataList.length,
                itemBuilder: ((context, index) {
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), border: Border.all(color: Colors.blue)),
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                  height: 150,
                  child: Row(
                    children: [
                      ClipRRect(borderRadius: BorderRadius.circular(15), child: Image.network("${dataList[index].image}", height: 80, width: 80, errorBuilder:
                                                  (context, error, stacktrace) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  child: Container(
                                                    height: 80,
                                                    width:
                                                        80,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                );
                                              })),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${dataList[index].name}", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            child: Text("${dataList[index].description}", overflow: TextOverflow.ellipsis, maxLines: 10, style: TextStyle(fontSize: 13.0),)),
                        ],
                      ),
                    ],
                  ),
                );
              })),),
            ],
          )),
        );
      }
    );
  }
}