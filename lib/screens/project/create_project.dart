import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:admin_client_portfolio/states/ThemeModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/medias_model.dart';

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
  @override
  Widget build(BuildContext context) {
    Function setCurrentParagraph = Provider.of<States>(context).setCurrentParagraph;
    Function setCurrentIndex = Provider.of<States>(context).setCurrentIndex;
    bool isDark = Provider.of<ModelTheme>(context).isDark;
    Paragraph paragraphInstance = Paragraph();

    Function addProject = Provider.of<States>(context).addProject;

    List<String> membersList = Provider.of<States>(context).membersList;
    Function addMember = Provider.of<States>(context).addMember;
    Function updateMember = Provider.of<States>(context).updateMember;
    Function deleteMember = Provider.of<States>(context).deleteMember;

    List<String> linksList = Provider.of<States>(context).linksList;
    Function addLink = Provider.of<States>(context).addLink;
    Function updateLink = Provider.of<States>(context).updateLink;
    Function deleteLink = Provider.of<States>(context).deleteLink;

    List<Paragraph> paragraphsList = Provider.of<States>(context).paragraphsList;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    double width = MediaQuery.of(context).size.width;

    Future<void> _memberDialog(BuildContext context, String memberName, int index) {
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
            content: TextFormField(controller: memberNameController,),
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
    Future<void> _linkDialog(BuildContext context, String link, int index) {
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

    late Project newProject = Project(
      id: 0,  // id gönderilmeyecek
      userID: 0,  //localde login olmuş user id si göndeirlicek
      projectName: "",
      projectType: "",
      projectTitle: "",
      introImg: "",
      projectIntro: "",
      paragraphs: [],
      medias: Medias(),
      members: [],
      links: [],
    );

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
                  {setCurrentParagraph(paragraphInstance), setIndexContent(6)},
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
              onTap: () => {_memberDialog(context, "",0)},
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
              onTap: ()=>{_memberDialog(context, membersList[index], index)},
              child: Chip(
                  label: Text(membersList[index]),
                labelStyle: const TextStyle(
                  overflow: TextOverflow.ellipsis
                ),
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
              onTap: () => {_linkDialog(context, "",0)},
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
              onTap: ()=>{_linkDialog(context, linksList[index], index)},
              child: Chip(
                label: Text(linksList[index]),
                labelStyle: const TextStyle(
                    overflow: TextOverflow.ellipsis
                ),
                clipBehavior: Clip.none,

              ),
            );
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            newProject.userID = 0, //localde login olmuş user id si göndeirlicek
            newProject.projectName = projectNameController.text,
            newProject.projectType = projectTypeController.text,
            newProject.projectTitle = projectTitleController.text,
            newProject.introImg = projectIntroImageController.text,
            newProject.projectIntro = projectIntroTextController.text,
            newProject.paragraphs = paragraphsList,
            newProject.medias = Medias(videos: [], images: []),
            newProject.members = membersList,
            newProject.links = linksList,
            addProject(newProject),
            Navigator.pushReplacementNamed(context, 'home_view')
          },
          child: const Text('Projeyi Oluştur'),
        ),
      ],
    );

  }
}
