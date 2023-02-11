import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
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
final TextEditingController projectIntroTextController =
    TextEditingController();
final TextEditingController projectIntroImageController =
    TextEditingController();

class _CreateProjectPageState extends State<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    Function setCurrentParagraph =
        Provider.of<States>(context).setCurrentParagraph;
    Function setCurrentIndex = Provider.of<States>(context).setCurrentIndex;
    Paragraph paragraphInstance = Paragraph();

    List paragraphsList = Provider.of<States>(context).paragraphsList;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    double width = MediaQuery.of(context).size.width;

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
        ElevatedButton(
          onPressed: () => {
            print('listem: ${paragraphsList}')
            /*Navigator.pushReplacementNamed(context, 'home_view')*/
          },
          child: const Text('Projeyi Oluştur'),
        ),
      ],
    );
  }
}
