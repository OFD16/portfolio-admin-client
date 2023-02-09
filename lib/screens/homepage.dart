import 'package:admin_client_portfolio/responsive/responsive_layout.dart';
import 'package:admin_client_portfolio/screens/about.dart';
import 'package:admin_client_portfolio/screens/desktop_body.dart';
import 'package:admin_client_portfolio/screens/mobile_body.dart';
import 'package:admin_client_portfolio/screens/post/create_post.dart';
import 'package:admin_client_portfolio/screens/post/detail_post.dart';
import 'package:admin_client_portfolio/screens/post/list_post.dart';
import 'package:admin_client_portfolio/screens/profile/profile.dart';
import 'package:admin_client_portfolio/screens/project/paragraph_detail.dart';
import 'package:admin_client_portfolio/screens/project/create_project.dart';
import 'package:admin_client_portfolio/screens/project/detail_project.dart';
import 'package:admin_client_portfolio/screens/project/list_project.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<Widget> contents = const [
  PostPage(),                 //0
  CreatePostPage(),           //1
  ProjectPage(),              //2
  CreateProjectPage(),        //3
  AboutPage(),                //4
  ProfilePage(),              //5
  ParagraphPage(),            //6
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        mobileBody: MyMobileBody("Mobile title", contents),
        desktopBody: MyDesktopBody("M A S A Ü S T Ü title", contents),
      ),
    );
  }
}
