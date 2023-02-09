import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParagraphPage extends StatefulWidget {
  const ParagraphPage({Key? key}) : super(key: key);

  @override
  State<ParagraphPage> createState() => _ParagraphPageState();
}

class _ParagraphPageState extends State<ParagraphPage> {
  @override
  Widget build(BuildContext context) {
    List paragraphsList = Provider.of<States>(context).paragraphsList;
    Function clearParagraphInstance = Provider.of<States>(context).clearParagraphInstance;
    Paragraph paragraphInstance = Provider.of<States>(context).paragraphInstance;
    Function addParagraph = Provider.of<States>(context).addParagraph;
    Function deleteParagraph = Provider.of<States>(context).deleteParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;


    TextEditingController firstVideoLinkC = TextEditingController(text: paragraphInstance.firstVideo);
    TextEditingController firstImgLinkC = TextEditingController(text: paragraphInstance.firstImg);
    TextEditingController leftImgLinkC = TextEditingController(text: paragraphInstance.leftImg);
    TextEditingController paragraphC = TextEditingController(text: paragraphInstance.paragraphText);
    TextEditingController rightImgLinkC = TextEditingController(text: paragraphInstance.rightImg);
    TextEditingController lastImgLinkC = TextEditingController(text: paragraphInstance.lastImg);
    TextEditingController lastVideoLinkC = TextEditingController(text: paragraphInstance.lastVideo);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Paragraf: '),
            Row(
              children: [
                IconButton(onPressed: ()=>{deleteParagraph(paragraphInstance), clearParagraphInstance(),setIndexContent(3), print('silinen paragprah: ${paragraphInstance}')}, icon: const Icon(Icons.delete)),
                IconButton(onPressed: ()=>{setIndexContent(3)}, icon: const Icon(Icons.arrow_back)),
              ],
            )
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Üst Video Linki: ",
            hintText: "url",
          ),
          controller: firstVideoLinkC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Üst Resim Linki: ",
            hintText: "url",
          ),
          controller: firstImgLinkC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Sol Resim Linki: ",
            hintText: "url",
          ),
          controller: leftImgLinkC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          minLines: 10,
          maxLines: 40,
          decoration: const InputDecoration(
            labelText: "Paragraf: ",
            hintText: "Loream ipsum...",
          ),
          controller: paragraphC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Sağ Resim Linki: ",
            hintText: "url",
          ),
          controller: rightImgLinkC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Alt Resim Linki: ",
            hintText: "url",
          ),
          controller: lastImgLinkC,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Alt Video Linki: ",
            hintText: "url",
          ),
          controller: lastVideoLinkC,
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async => {
            paragraphInstance.firstVideo = firstVideoLinkC.text,
            paragraphInstance.firstImg = firstImgLinkC.text,
            paragraphInstance.leftImg = leftImgLinkC.text,
            paragraphInstance.paragraphText = paragraphC.text,
            paragraphInstance.rightImg = rightImgLinkC.text,
            paragraphInstance.lastImg = lastImgLinkC.text,
            paragraphInstance.lastVideo = lastVideoLinkC.text,

            addParagraph(paragraphInstance),
            setIndexContent(3),
          },
          child: const Text('Onayla'),
        ),

      ],
    );
  }
}
