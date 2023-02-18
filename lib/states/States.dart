import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class States extends ChangeNotifier {
  User localUserData =  User(id: 0, firstName: "", lastName: "", age: 0, email: "", userImg: "", socialLinks: {}, introduction: "", medias: Medias(videos: [],images: []), markedProjects: [], markedBlogs: [], experiences: [], education: [], skills: [], role: "user");
  void setLocalUser(User user){
    localUserData = user;
    notifyListeners();
  }
  User getLocalUser(){
    return localUserData ;
    notifyListeners();
  }


  int indexContent = 0;
  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }
  int lastIndexContent = 0;
  void setLastIndexContent(int index) {
    lastIndexContent = index;
    notifyListeners();
  }
}
