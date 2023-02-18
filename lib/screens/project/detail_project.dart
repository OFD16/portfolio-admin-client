
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/Cards/ImageCard.dart';
import '../../models/paragraph_model.dart';
import '../../models/project_model.dart';
import '../../services/services.dart';
import '../../states/States.dart';
import '../../states/ThemeModel.dart';
import '../../states/project_provider.dart';

class ProjectDetailPage extends StatefulWidget {
  const ProjectDetailPage({Key? key}) : super(key: key);

  @override
  State<ProjectDetailPage> createState() => _ProjectDetailPageState();
}

class _ProjectDetailPageState extends State<ProjectDetailPage> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Function setLastIndexContent = Provider.of<States>(context).setLastIndexContent;

    Project currentProject = Provider.of<ProjectStates>(context).currentProject;

    final TextEditingController projectNameController = TextEditingController(text: currentProject.projectName);
    final TextEditingController projectTypeController = TextEditingController(text: currentProject.projectType);
    final TextEditingController projectTitleController = TextEditingController(text: currentProject.projectTitle);
    final TextEditingController projectIntroTextController = TextEditingController(text: currentProject.projectIntro);
    final TextEditingController projectIntroImageController = TextEditingController(text: currentProject.introImg);

    final TextEditingController memberNameController = TextEditingController();
    final TextEditingController linkController = TextEditingController();

    Function setCurrentParagraph = Provider.of<ProjectStates>(context).setCurrentParagraph;
    Function setCurrentParagraphIndex = Provider.of<ProjectStates>(context).setCurrentParagraphIndex;
    Paragraph paragraphInstance = Paragraph();

    List<String> currentProjectMembers = Provider.of<ProjectStates>(context).currentProjectMembers;
    Function addProjectMember = Provider.of<ProjectStates>(context).addProjectMember;
    Function updateProjectMember = Provider.of<ProjectStates>(context).updateProjectMember;
    Function deleteProjectMember = Provider.of<ProjectStates>(context).deleteProjectMember;

    List<String> currentProjectLinks = Provider.of<ProjectStates>(context).currentProjectLinks;
    Function addProjectLink = Provider.of<ProjectStates>(context).addProjectLink;
    Function updateProjectLink = Provider.of<ProjectStates>(context).updateProjectLink;
    Function deleteProjectLink = Provider.of<ProjectStates>(context).deleteProjectLink;

    void deleteProject(int id) async {
      await Services().deleteProject(id).then((res) => {
        if (res["statusCode"] == 204){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Proje Başarıyla Silindi"))),
            setIndexContent(0),
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res["errorMessage"])))
          }
      });
    }

    void updateProject(Project project, int id) async {
      await Services().updateProject(project, id).then((res) => {
        if (res.runtimeType == Project){
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Proje Başarıyla Güncellendi"))),
            setIndexContent(2),
          } else {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res["errorMessage"]))),
          }
      });
    }

    Future<void> memberDialog(BuildContext context, String memberName, int index) {
      memberNameController.text = memberName;
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=>{Navigator.of(context).pop()}, icon: const Icon(Icons.arrow_back)),
                const Text('Üye Ekle/Düzenle'),
                IconButton(onPressed: ()=>{deleteProjectMember(memberNameController.text), Navigator.of(context).pop()}, icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(controller: memberNameController,),
            actions: <Widget>[
              TextButton(
                child: Text('Ekle/Düzenle', style: TextStyle(color: isDark ? null : Colors.deepPurple[800]),),
                onPressed: () {
                  memberName == "" ? addProjectMember(memberNameController.text) : updateProjectMember(memberNameController.text, index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    Future<void> linkDialog(BuildContext context, String link, int index) {
      linkController.text = link;
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: ()=>{Navigator.of(context).pop()}, icon: const Icon(Icons.arrow_back)),
                const Text('Link Ekle/Düzenle'),
                IconButton(onPressed: ()=>{deleteProjectLink(linkController.text), Navigator.of(context).pop()}, icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(controller: linkController,),
            actions: <Widget>[
              TextButton(
                child: Text('Ekle/Düzenle', style: TextStyle(color: isDark ? null : Colors.deepPurple[800]),),
                onPressed: () {
                  link == "" ? addProjectLink(linkController.text) : updateProjectLink(linkController.text, index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> sureCheckDialog(BuildContext context, int id) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Silmek İstediğine Emin Misin?'),
            actions: <Widget>[
              TextButton(
                  onPressed: () => {Navigator.of(context).pop()},
                  child:
                  const Text('Hayır', style: TextStyle(color: Colors.red))),
              TextButton(
                  onPressed: () =>
                  {deleteProject(id), Navigator.of(context).pop()},
                  child: const Text('Evet,eminim.')),
            ],
          );
        },
      );
    }

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => {setIndexContent(2)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Proje Düzenle: '),
            IconButton(
                onPressed: () => {sureCheckDialog(context, currentProject.id)},
                icon: const Icon(Icons.delete)),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Proje Adı",
            hintText: "ERP  projesi",
          ),
          controller: projectNameController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Proje Tipi",
            hintText: "Redesign",
          ),
          controller: projectTypeController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Proje Başlığı",
            hintText: "UI/UX Design",
          ),
          controller: projectTitleController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Proje İntro Resim Linki: ",
            hintText: "url",
          ),
          controller: projectIntroImageController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Proje İntrosu",
            hintText: "...",
          ),
          controller: projectIntroTextController,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Paragraflar'),
            InkWell(
              onTap: () => {
                setCurrentParagraph(paragraphInstance),
                setIndexContent(6),
                setLastIndexContent(10)
              },
              child: const Row(
                children: [
                  Text('Paragraf Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: (width < 1060 ? (width < 800 ? (width < 650 ? 2 : 4) : 6) : 8)),
          itemCount: currentProject.paragraphs.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {
              setCurrentParagraph(currentProject.paragraphs[index]),
              setCurrentParagraphIndex(index),
              setIndexContent(7),
              setLastIndexContent(10)
            });
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Üyeler'),
            InkWell(
              onTap: () => {memberDialog(context, "",0)},
              child: const Row(
                children: [
                  Text('Üye Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: (width < 1060 ? (width < 800 ? (width < 650 ? 5 : 5) : 10) : 15)),
          itemCount: currentProjectMembers.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>{memberDialog(context, currentProjectMembers[index], index)},
              child: Chip(
                label: Text(currentProjectMembers[index]),
                labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                clipBehavior: Clip.none,
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Linkler'),
            InkWell(
              onTap: () => {linkDialog(context, "",0)},
              child: const Row(
                children: [
                  Text('Link Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            crossAxisCount: (width < 1060 ? (width < 800 ? (width < 650 ? 5 : 5) : 10) : 15)),
          itemCount: currentProjectLinks.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>{linkDialog(context, currentProjectLinks[index], index)},
              child: Chip(
                label: Text(currentProjectLinks[index]),
                labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                clipBehavior: Clip.none,
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            currentProject.members = currentProjectMembers,
            currentProject.links = currentProjectLinks,
            updateProject(currentProject, currentProject.id),
          },
          child: const Text('Projeyi Oluştur'),
        ),
      ],
    );

  }
}