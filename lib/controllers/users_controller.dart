import 'package:get/get.dart';

import '../models/users_models.dart';

class UsersController extends GetxController{

  var dataList = <UsersModel>[];
  var title = "";
  var description = "";

  getData(jsonResult){
    var data = <UsersModel>[];
    jsonResult['data']['platforms'].forEach((e) { 
    data.add(UsersModel.fromJSON(e));
      dataList = data;
      title = jsonResult['data']['title'];
      description = jsonResult['data']['description'];
    });
    update();
  }

}