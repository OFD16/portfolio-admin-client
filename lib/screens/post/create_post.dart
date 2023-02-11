import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

final TextEditingController postNameController = TextEditingController();
final TextEditingController postTypeController = TextEditingController();
final TextEditingController postTitleController = TextEditingController();
final TextEditingController postIntroTextController =
TextEditingController();
final TextEditingController postIntroImageController =
TextEditingController();

class _CreatePostPageState extends State<CreatePostPage> {
  @override
  Widget build(BuildContext context) {
    Function setCurrentParagraph =
        Provider.of<States>(context).setCurrentParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    Paragraph paragraphInstance = Paragraph();

    Function setCurrentIndex1 = Provider.of<States>(context).setCurrentIndex1;
    List paragraphsList1 = Provider.of<States>(context).paragraphsList1;
    double width = MediaQuery.of(context).size.width;

    return ListView(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Adı",
            hintText: "Hata  Blog",
          ),
          controller: postNameController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Tipi",
            hintText: "Redesign",
          ),
          controller: postTypeController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog Başlığı",
            hintText: "UI/UX Design",
          ),
          controller: postTitleController,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog İntro Resim Linki: ",
            hintText: "url",
          ),
          controller: postIntroImageController,
        ),
        //ImageCard("Blognin Ana Resim Linki:"),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Blog İntrosu",
            hintText: "...",
          ),
          controller: postIntroTextController,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Paragraflar'),
            InkWell(
              onTap: () =>
              {setCurrentParagraph(paragraphInstance), setIndexContent(8)},
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
          itemCount: paragraphsList1.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageCard(() => {
              setCurrentParagraph(paragraphsList1[index]),
              setCurrentIndex1(index),
              setIndexContent(9),
            });
          },
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => {
            print('listem: ${paragraphsList1}')
            /*Navigator.pushReplacementNamed(context, 'home_view')*/
          },
          child: const Text('Bloğu Oluştur'),
        ),
      ],
    );
  }
}
