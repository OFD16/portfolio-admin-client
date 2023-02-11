import 'package:admin_client_portfolio/modals/experienceModal.dart';
import 'package:admin_client_portfolio/models/experience_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  bool edit = false;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _secondNameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _introductionController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _markedProjectsController = TextEditingController();
  TextEditingController _markedBlogsController = TextEditingController();
  List socialLinks = [];
  List markedProjects = [];
  List markedBlogs = [];
  List experiences = [
    Experience(
        startedTime: "12 eylül 2020",
        finishedTime: "13 haziran 2020",
        companyName: "SOLVIO",
        jobName: "ömere basmak",
        introduction: "patır kütür basma keyfi",
        image: 'https://cdn-icons-png.flaticon.com/512/4526/4526587.png'),
    Experience(
        startedTime: "21 temmuz 2021",
        finishedTime: "31 aralık 2021",
        companyName: "CNN",
        jobName: "Polis",
        introduction: "Gizli görev",
        image: 'https://cdn-icons-png.flaticon.com/512/4526/4526587.png'),
  ];

  addMarkedProjectNum(String number) {
    markedProjects.add(number);
  }

  addMarkedBlogNum(String number) {
    markedBlogs.add(number);
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Hakkımda'),
            Container(
              color: !edit ? Colors.red : Colors.green,
              child: IconButton(
                  splashRadius: 1,
                  onPressed: () => {
                        setState(() => {edit = !edit})
                      },
                  icon: const Icon(Icons.edit)),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                controller: _firstNameController,
                decoration: const InputDecoration(
                    labelText: "İsim", labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                controller: _secondNameController,
                decoration: const InputDecoration(
                    labelText: "Soyisim", labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 1,
              child: TextField(
                enabled: edit,
                controller: _ageController,
                decoration: const InputDecoration(
                    labelText: "Yaş", labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: "E-mail", labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                controller: _imageUrlController,
                decoration: const InputDecoration(
                    labelText: "Fotoğraf URL",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                maxLines: 5,
                enabled: edit,
                controller: _introductionController,
                decoration: const InputDecoration(
                    labelText: "Introduction",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              flex: 4,
              child: TextField(
                maxLines: 5,
                enabled: edit,
                controller: _descriptionController,
                decoration: const InputDecoration(
                    labelText: "Description",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                controller: _markedProjectsController,
                decoration: const InputDecoration(
                    labelText: "İşaretli Proje Numarları",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            IconButton(
                onPressed: !edit
                    ? null
                    : () {
                        setState(() {
                          addMarkedProjectNum(_markedProjectsController.text);
                        });
                      },
                icon: const Icon(Icons.add)),
            const SizedBox(width: 86),
            Expanded(
              flex: 4,
              child: TextField(
                enabled: edit,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ],
                controller: _markedBlogsController,
                decoration: const InputDecoration(
                    labelText: "İşaretli Blog Numaraları",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            IconButton(
                onPressed: !edit
                    ? null
                    : () {
                        setState(() {
                          addMarkedBlogNum(_markedBlogsController.text);
                        });
                      },
                icon: const Icon(Icons.add)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(4)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: markedProjects.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(
                        markedProjects[index].toString() + " numaralı proje");
                  }),
            )),
            const SizedBox(width: 24),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(4)),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: markedBlogs.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text(markedBlogs[index] + " numaralı blog");
                  }),
            )),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            const Text("Experiences",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            IconButton(onPressed: !edit ? null : () {
              showDialog(context: context, builder: (ctx) => ExperienceModal());
            }, icon: const Icon(Icons.add)),
          ],
        ),
        const SizedBox(height: 8),
        GridView.builder(
          shrinkWrap: true,
          itemCount: experiences.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 3/2,
            crossAxisCount: 4,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.redAccent, width: 2)),
              child: Column(
                children: [
                  Container(
                      child: Image.network(
                          experiences[index].image),
                      height: 50,
                  ),
                  const SizedBox(height:20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(experiences[index].jobName.toUpperCase(),style: const TextStyle(fontSize: 16),softWrap: true,),
                      Text(experiences[index].companyName,softWrap: true,),
                      Text(experiences[index].introduction,softWrap: true,),
                      Row(
                        children: [
                          Text(experiences[index].startedTime! + " - ",style: const TextStyle(fontStyle: FontStyle.italic),softWrap: true,),
                          Text(experiences[index].finishedTime!,style: const TextStyle(fontStyle: FontStyle.italic),softWrap: true,),
                        ],
                      )
                    ],
                  )
                ],
              ),
            );
          },
        )
      ],
    );
  }
}
