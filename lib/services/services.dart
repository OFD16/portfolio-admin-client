import 'dart:convert';
import 'dart:io';

import 'package:admin_client_portfolio/models/post_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:admin_client_portfolio/sharedPreferences/localLogin.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/storage/Storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../models/login_data.dart';
import '../models/user_model.dart';
import '../sharedPreferences/localUser.dart';

class Services {
  String baseUrl = "http://localhost:5000/";

//Login
  Future login(LoginData loginData) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url = Uri.parse('${baseUrl}login');

    http.Response res = await http.post(url, body: json.encode(loginData.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 200) {
      var token = body["token"];
      var tokenTime = body["tokenTime"];
      SecureStorage().writeSecureData("token", token);
      User user = User.fromJson(body["user"]);
      LocalUserData().setLocalUser(user);
      LoginValue().setLoginValue(true);
      print('user: $user');
      return body;
    } else {
      print('body: $body');
      return body;
    }
  }

//Blog
  Future<List> getBlogs() async {
    var url = Uri.parse('${baseUrl}blogs');
    http.Response res = await http.get(url);

    List blogs = jsonDecode(res.body);
    return blogs;
  }

  Future getBlogByID(int id) async {
    var url = Uri.parse('${baseUrl}blogs/$id');
    http.Response res = await http.get(url);
    // print('res: ${res.body}');
    Post body = Post.fromJson(jsonDecode(res.body));
    //print('body: ${body.paragraphs[0].paragraph}');
    return body;
  }

  Future<Post> createBlog(Post post) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url = Uri.parse('${baseUrl}blogs');

    http.Response res = await http.post(url, body: json.encode(post.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 201) {
      Post blog = Post.fromJson(body);
      //print('blog: $blog');
      return blog;
    } else {
      //print('error: $body');
      return body;
    }
  }

  Future<Post> updateBlog(Post post, int id) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url = Uri.parse('${baseUrl}blogs/$id');
    http.Response res = await http.patch(url, body: json.encode(post.toJson()), headers: headers);

    var body = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 200) {
      Post blog = Post.fromJson(body);
      //print('blog: $blog');
      return blog;
    } else {
      //print('error: $body');
      return body;
    }
  }

  Future deleteBlog(int id) async {
    var url = Uri.parse('${baseUrl}blogs/$id');
    http.Response res = await http.delete(url);
    if (res.body.isNotEmpty) {
      var body = jsonDecode(res.body);
      return body;
    } else {
      return {"statusCode": 204, "success": true};
    }
  }

//Project
  Future<List> getProjects() async {
    var url = Uri.parse('${baseUrl}projects');
    http.Response res = await http.get(url);

    List projects = jsonDecode(res.body);
    //print('projeler: $projects');
    return projects;
  }

  Future getProjectByID(int id) async {
    var url = Uri.parse('${baseUrl}projects/$id');
    http.Response res = await http.get(url);
    //print('res: ${res.body}');
    Project body = Project.fromJson(jsonDecode(res.body));
    //print('paragraph: ${body.paragraphs[0].paragraph}');
    return body;
  }

  Future<Project> createProject(Project project) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url = Uri.parse('${baseUrl}projects');

    http.Response res = await http.post(url, body: json.encode(project.toJson()), headers: headers);
    var body = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 201) {
      Project project = Project.fromJson(body);
      //print('project: $project');
      return project;
    } else {
      //print('project: $body');
      return body;
    }
  }

  Future<Project> updateProject(Project project, int id) async {
    var headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    var url = Uri.parse('${baseUrl}projects/$id');
    http.Response res = await http.patch(url, body: json.encode(project.toJson()), headers: headers);

    var body = jsonDecode(utf8.decode(res.bodyBytes));
    if (res.statusCode == 200) {
      Project project = Project.fromJson(body);
      print('project: $project');
      return project;
    } else {
      print('error: $body');
      return body;
    }
  }

  Future deleteProject(int id) async {
    var url = Uri.parse('${baseUrl}projects/$id');
    http.Response res = await http.delete(url);
    if (res.body.isNotEmpty) {
      var body = jsonDecode(res.body);
      return body;
    } else {
      return {"statusCode": 204, "success": true};
    }
  }

  //User
}
