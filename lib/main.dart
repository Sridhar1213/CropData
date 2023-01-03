import 'package:flutter/material.dart';
import 'package:flutter_application_6/controllers/users_controller.dart';
import 'package:get/get.dart';

import 'views/home_view.dart';

void main() {
  _initController();
  runApp(MyApp());
}

_initController() {
  Get.put(UsersController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter CropData Task',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
