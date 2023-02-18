import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:admin_client_portfolio/states/project_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/medias_model.dart';
import '../../models/user_model.dart';
import '../../services/services.dart';
import '../../sharedPreferences/localUser.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({Key? key}) : super(key: key);

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

final TextEditingController projectNameController = TextEditingController();
final TextEditingController projectTypeController = TextEditingController();
final TextEditingController projectTitleController = TextEditingController();
final TextEditingController projectIntroTextController = TextEditingController();
final TextEditingController projectIntroImageController = TextEditingController();
final TextEditingController memberNameController = TextEditingController();
final TextEditingController linkController = TextEditingController();

class _CreateProjectPageState extends State<CreateProjectPage> {
  User localUser = User(id: 0, firstName: "", lastName: "", age: 0, email: "", userImg: "", introduction: "", markedProjects: [], markedBlogs: [], role: "");

  @override
  void initState() {
    super.initState();
    _loadLocalUser();
  }

  void _loadLocalUser() async {
    localUser = await LocalUserData().getLocalUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Function setLastIndexContent = Provider.of<States>(context).setLastIndexContent;

    List<Paragraph> paragraphsList = Provider.of<ProjectStates>(context).paragraphsList;
    Function clearParagraphs = Provider.of<ProjectStates>(context).clearParagraphs;
    Function setCurrentParagraph = Provider.of<ProjectStates>(context).setCurrentParagraph;
    Function setCurrentIndex = Provider.of<ProjectStates>(context).setCurrentIndexC;
    Paragraph paragraphInstance = Paragraph();

    List<String> membersList = Provider.of<ProjectStates>(context).currentProjectMembers;
    Function addMember = Provider.of<ProjectStates>(context).addProjectMember;
    Function updateMember = Provider.of<ProjectStates>(context).updateProjectMember;
    Function deleteMember = Provider.of<ProjectStates>(context).deleteProjectMember;
    Function clearMembers = Provider.of<ProjectStates>(context).clearProjectMembers;

    List<String> linksList = Provider.of<ProjectStates>(context).currentProjectLinks;
    Function addLink = Provider.of<ProjectStates>(context).addProjectLink;
    Function updateLink = Provider.of<ProjectStates>(context).updateProjectLink;
    Function deleteLink = Provider.of<ProjectStates>(context).deleteProjectLink;
    Function clearLinks = Provider.of<ProjectStates>(context).clearProjectLinks;

    Project newProject = Project(id: 0,userID: 0, projectName: "", projectType: "", projectTitle: "", introImg: "", projectIntro: "", paragraphs: [], medias: Medias(images: [], videos: []), members: [], links: []);

    void createProject (Project project) async {
      await Services().createProject(project).then((res) => {
        if(newProject.userID == res.userID){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Proje Başarıyla Oluşturuldu"))),
          setIndexContent(2),

          ///Sayfadan çıktıktan sonra içeriğini temizleme
          projectNameController.text = "",
          projectTypeController.text = "",
          projectTitleController.text = "",
          projectIntroImageController.text = "",
          projectIntroTextController.text = "",
          clearParagraphs(),
          clearMembers(),
          clearLinks(),
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Proje oluşturulurken bir sorun oluştu :(")))
        }
      } );
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
                IconButton(onPressed: ()=>{deleteMember(memberNameController.text), Navigator.of(context).pop()}, icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(controller: memberNameController),
            actions: <Widget>[
              TextButton(
                child: Text('Ekle/Düzenle', style: TextStyle(color: isDark ? null : Colors.deepPurple[800]),),
                onPressed: () {
                  memberName == "" ? addMember(memberNameController.text) : updateMember(memberNameController.text, index);
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
                IconButton(onPressed: ()=>{deleteLink(linkController.text), Navigator.of(context).pop()}, icon: const Icon(Icons.delete)),
              ],
            ),
            content: TextFormField(controller: linkController,),
            actions: <Widget>[
              TextButton(
                child: Text('Ekle/Düzenle', style: TextStyle(color: isDark ? null : Colors.deepPurple[800]),),
                onPressed: () {
                  link == "" ? addLink(linkController.text) : updateLink(linkController.text, index);
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return ListView(
      children: [
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
              onTap: () =>
                  {setCurrentParagraph(paragraphInstance),setLastIndexContent(3), setIndexContent(6)},
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
            crossAxisCount: (width < 1060
                ? (width < 800 ? (width < 650 ? 2 : 4) : 6)
                : 8),
          ),
          itemCount: paragraphsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {
                  setCurrentParagraph(paragraphsList[index]),
                  setCurrentIndex(index),
                  setIndexContent(7),
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
            crossAxisCount: (width < 1060
                ? (width < 800 ? (width < 650 ? 5 : 5) : 10)
                : 15),
          ),
          itemCount: membersList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>{memberDialog(context, membersList[index], index)},
              child: Chip(
                label: Text(membersList[index]),
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
            crossAxisCount: (width < 1060
                ? (width < 800 ? (width < 650 ? 5 : 5) : 10)
                : 15),
          ),
          itemCount: linksList.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: ()=>{linkDialog(context, linksList[index], index)},
              child: Chip(
                label: Text(linksList[index]),
                labelStyle: const TextStyle(overflow: TextOverflow.ellipsis),
                clipBehavior: Clip.none,

              ),
            );
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            newProject.projectName = projectNameController.text,
            newProject.projectType = projectTypeController.text,
            newProject.projectTitle = projectTypeController.text,
            newProject.introImg = projectIntroImageController.text,
            newProject.projectIntro = projectIntroTextController.text,
            newProject.paragraphs = paragraphsList,
            newProject.medias = Medias(videos: [],images: []),
            newProject.userID = localUser.id, // localdeki login olmuş user id si gönderilicek
            newProject.members = membersList,
            newProject.links = linksList,
            createProject(newProject),
          },
          child: const Text('Projeyi Oluştur'),
        ),
      ],
    );

  }
}
