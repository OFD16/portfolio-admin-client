
import 'dart:async';

import 'package:admin_client_portfolio/states/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_model.dart';
import '../sharedPreferences/localLogin.dart';
import '../sharedPreferences/localUser.dart';
import '../states/States.dart';
import '../states/ThemeModel.dart';
import '../states/post_provider.dart';
import '../theme.dart';
import 'Cards/ProcessCard.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

List<bool> _isOpen = [false, false, false];
List items = <Map<String, dynamic>>[
  {
    "processTitle": "Blog Yazılarım",
    "iconName": Icons.signpost,
    "page": 0,
  },
  {
    "processTitle": "Projelerim",
    "iconName": Icons.library_books,
    "page": 1,
  },
  {
    "processTitle": "Profilim",
    "iconName": Icons.person,
    "page": 2,
  },
];

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  void initState() {
    Timer.periodic(const Duration(minutes: 1), (timer) async {
      String lastLoginTimeStr = await LoginValue().getLoginTime() as String;
      DateTime lastLoginTime = DateTime.parse(lastLoginTimeStr);

      // Check if 24 hours have elapsed
      Duration elapsed = DateTime.now().difference(lastLoginTime);
      if (elapsed.inHours >= 23) {
        LoginValue().setLoginValue(false);
        LocalUserData().setLocalUser(User(id: 0, firstName: '', lastName: '', age: 0, email: '', userImg: '', introduction: '', markedProjects: [], markedBlogs: [], role: ''));
        Navigator.pushReplacementNamed(context, 'login_view');
        // Cancel the timer
        timer.cancel();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    int indexContent = Provider.of<States>(context).indexContent;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    Function clearParagraphs = Provider.of<PostStates>(context).clearParagraphs;
    Function clearPostLinks = Provider.of<PostStates>(context).clearPostLinks;

    Function clearParagraphsP = Provider.of<ProjectStates>(context).clearParagraphs;
    Function clearProjectMembers = Provider.of<ProjectStates>(context).clearProjectMembers;
    Function clearProjectLinks = Provider.of<ProjectStates>(context).clearProjectLinks;

    return Consumer(builder: (context, ModelTheme theme, child) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 200, //darkCard
              color:
                  theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
              child: ListView(
                children: [
                  ExpansionPanelList(
                    dividerColor: Colors.transparent,
                    elevation: 0,
                    expansionCallback: (i, isOpen) => setState(() {
                      _isOpen[i] = !isOpen;
                    }),
                    children: [
                      ExpansionPanel(
                        backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Bloglar", Icons.signpost_sharp, () => setState(() {
                              _isOpen[0] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Blogları Listele", Icons.list, () => {setIndexContent(0)}, indexContent == 0 || indexContent == 11 && (indexContent != 1 || indexContent != 2 || indexContent != 3 || indexContent != 4 || indexContent != 5) ),
                              ProcessCard(
                                  "Yeni Blog Oluştur",
                                  Icons.add, () => {clearParagraphs(), clearPostLinks(), setIndexContent(1)},
                                  indexContent == 1 && (indexContent != 0 || indexContent != 2 || indexContent != 3 || indexContent != 4 || indexContent != 5)),
                            ],
                          ),
                          isExpanded: _isOpen[0]),
                      ExpansionPanel(
                          backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Projeler", Icons.file_copy, () => setState(() {
                              _isOpen[1] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Projeleri Listele", Icons.list, () => {setIndexContent(2)}, indexContent == 2 || indexContent == 10 && (indexContent != 1 || indexContent != 0 || indexContent != 3 || indexContent != 4 || indexContent != 5)),
                              ProcessCard(
                                  "Yeni Proje Oluştur", Icons.add, () => {clearParagraphsP(), clearProjectMembers(), clearProjectLinks(),setIndexContent(3)}, indexContent == 3 && (indexContent != 1 || indexContent != 2 || indexContent != 0 || indexContent != 4 || indexContent != 5) ),
                            ],
                          ),
                          isExpanded: _isOpen[1]),
                      /*ExpansionPanel(
                          backgroundColor: theme.isDark ? AppColors().darkCard : Colors.deepPurple[300],
                          headerBuilder: (context, isOpen) {
                            return ProcessCard(
                                "Kullanıcılar", Icons.people, () => setState(() {
                              _isOpen[2] = !isOpen;
                            }), false);
                          },
                          body: Column(
                            children: [
                              ProcessCard(
                                  "Kullanıcılar Listele", Icons.list, () => {setIndexContent(6)}, indexContent == 6),
                              ProcessCard(
                                  "Yeni Kullanıcı Oluştur", Icons.add, () => {setIndexContent(7)}, indexContent == 7),
                            ],
                          ),
                          isExpanded: _isOpen[2]),*/
                    ],
                  ),
                  ProcessCard(
                      "Hakkımda", Icons.info, () => {setIndexContent(4)}, indexContent == 4 && (indexContent != 1 || indexContent != 2 || indexContent != 3 || indexContent != 0 || indexContent != 5)),
                  ProcessCard(
                      "Profilim", Icons.person, () => {setIndexContent(5)}, indexContent == 5 && (indexContent != 1 || indexContent != 2 || indexContent != 3 || indexContent != 4 || indexContent != 0)),
                  ProcessCard(
                      "Çıkış Yap",
                      Icons.exit_to_app,
                      () => {
                        LoginValue().setLoginValue(false),
                        LocalUserData().setLocalUser(User(id: 0, firstName: '', lastName: '', age: 0, email: '', userImg: '', introduction: '', markedProjects: [], markedBlogs: [], role: '')),
                            Navigator.pushReplacementNamed(context, 'login_view')
                          }, false),
                ],
              )));
    });
  }
}
