import 'package:admin_client_portfolio/responsive/responsive_layout.dart';
import 'package:admin_client_portfolio/screens/about.dart';
import 'package:admin_client_portfolio/screens/desktop_body.dart';
import 'package:admin_client_portfolio/screens/mobile_body.dart';
import 'package:admin_client_portfolio/screens/post/create_paragraph.dart';
import 'package:admin_client_portfolio/screens/post/create_post.dart';
import 'package:admin_client_portfolio/screens/post/detail_post.dart';
import 'package:admin_client_portfolio/screens/post/edit_paragraph.dart';
import 'package:admin_client_portfolio/screens/post/list_post.dart';
import 'package:admin_client_portfolio/screens/profile/profile.dart';
import 'package:admin_client_portfolio/screens/project/create_paragraph.dart';

import 'package:admin_client_portfolio/screens/project/create_project.dart';
import 'package:admin_client_portfolio/screens/project/detail_project.dart';
import 'package:admin_client_portfolio/screens/project/edit_paragraph.dart';
import 'package:admin_client_portfolio/screens/project/list_project.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

List<Widget> contents = const [
  PostPage(),                 //0  Post Listeleme
  CreatePostPage(),           //1  Post Oluşturma
  ProjectPage(),              //2  Projeleri Listeleme
  CreateProjectPage(),        //3  Proje Oluşturma
  AboutPage(),                //4
  ProfilePage(),              //5
  CreateParagraph(),          //6  Proje Paragraf Oluşturma
  EditParagraph(),            //7  Proje Paragraf Edit
  CreateParagraph1(),         //8  Post Paragraf Oluşturma
  EditParagraph1(),           //9  Post Paragraf Edit
  ProjectDetailPage(),        //10 Proje Detay Edit
  PostDetailPage(),           //11 Post Detay Edit
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
