import 'dart:convert';

import 'package:admin_client_portfolio/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../states/States.dart';

class LocalUserData {
  static const _localUserDataKey = "_localUserDataKey";

  setLocalUser(User newUser) async {
    String jsonUser = json.encode(newUser.toJson());
    States().setLocalUser(newUser);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_localUserDataKey, jsonUser);
  }

   getLocalUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? jsonUser = sharedPreferences.getString(_localUserDataKey);

    if (jsonUser != null) {
      Map<String, dynamic> userMap = json.decode(jsonUser);
      User user = User.fromJson(userMap);
      print('user: ${user.id}');
      return user;
    } else {
      return User(id: 0, firstName: "", lastName: "", age: 0, email: "", userImg: "", introduction: "", markedProjects: [], markedBlogs: [], role: "");
    }
  }
}