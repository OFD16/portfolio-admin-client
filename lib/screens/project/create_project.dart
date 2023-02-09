import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:admin_client_portfolio/components/Cards/ParagraphCard.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

class _CreateProjectPageState extends State<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    Paragraph paragraphInstance = Provider.of<States>(context).paragraphInstance;
    Function setParagraphInstance = Provider.of<States>(context).setParagraphInstance;
    Function clearParagraphInstance = Provider.of<States>(context).clearParagraphInstance;

    List paragraphsList = Provider.of<States>(context).paragraphsList;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    double width = MediaQuery.of(context).size.width;

    return ListView(
      shrinkWrap: true,
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
        //ImageCard("Projenin Ana Resim Linki:"),
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
              onTap: ()=>{ clearParagraphInstance(), setIndexContent(6)},
              child: const Row(
                children: [
                  Text('Paragraf Ekle'),
                  Icon(Icons.add),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          height: 120,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount:
              (width < 1060 ? (width < 800 ? (width < 650 ? 2 : 4) : 6) : 8),
            ),
            itemCount: paragraphsList.length,
            itemBuilder: (BuildContext context, int index) {
              return ImageCard(()=>{setParagraphInstance(paragraphsList[index]) ,setIndexContent(6)});
            },
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () =>
              {
                /*Navigator.pushReplacementNamed(context, 'home_view')*/
              },
          child: const Text('Projeyi Oluştur'),
        ),
      ],
    );
  }
}
