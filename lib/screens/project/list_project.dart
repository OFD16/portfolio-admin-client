import 'package:admin_client_portfolio/components/Cards/PostCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/project_model.dart';
import '../../services/services.dart';
import '../../states/States.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projectList = [];

  @override
  void initState() {
    getProjects();
    super.initState();
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    List<Project> myProjects = projectList;
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount:
              (width < 1060 ? (width < 800 ? (width < 650 ? 1 : 2) : 3) : 4),
        ),
        itemCount: myProjects.length,
        itemBuilder: (BuildContext context, int index) {
          return PostCard(myProjects[index].introImg, myProjects[index].projectName, () => {
            setIndexContent(10),
          });
        });
  }

  void getProjects () async {
    List<Project> lists = await Services().getProjects();
    projectList = lists;
  }
}
