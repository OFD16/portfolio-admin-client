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
                icon: Icon(Icons.add)),
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
                icon: Icon(Icons.add)),
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
            SizedBox(width: 24),
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
      ],
    );
  }
}
