

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Cards/PostCard.dart';
import '../../models/project_model.dart';
import '../../models/user_model.dart';
import '../../services/services.dart';
import '../../sharedPreferences/localUser.dart';
import '../../states/States.dart';
import '../../states/project_provider.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projectList = [];

  User localUser = User(
      id: 0,
      firstName: "",
      lastName: "",
      age: 0,
      email: "",
      userImg: "",
      introduction: "",
      markedProjects: [],
      markedBlogs: [],
      role: "");
  @override
  void initState() {
    getProjects();
    _loadLocalUser();
    super.initState();
  }
  void _loadLocalUser() async {
    localUser = await LocalUserData().getLocalUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Function setLastIndexContent = Provider.of<States>(context).setLastIndexContent;

    Function setCurrentProject = Provider.of<ProjectStates>(context).setCurrentProject;
    Function setCurrentProjectIndex = Provider.of<ProjectStates>(context).setCurrentProjectIndex;
    Function setCurrentProjectMembers = Provider.of<ProjectStates>(context).setCurrentProjectMembers;
    Function setCurrentProjectLinks = Provider.of<ProjectStates>(context).setCurrentProjectLinks;

    List<Project> myProjects = projectList;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: (width < 1060 ? (width < 800 ? (width < 650 ? 1 : 2) : 3) : 4)),
        itemCount: myProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(myProjects[index].introImg, myProjects[index].projectName, () => {
            setCurrentProject(myProjects[index]),
            setCurrentProjectIndex(index),
            setCurrentProjectMembers(myProjects[index].members),
            setCurrentProjectLinks(myProjects[index].links),
            setLastIndexContent(3),
            setIndexContent(10),
          });
        });
  }

  void getProjects () async {
    List<Project> lists = await Services().getProjects();
    List<Project> filteredLists = lists.where((item) => item.userID == localUser.id).toList();
    projectList = filteredLists;
  }
}
