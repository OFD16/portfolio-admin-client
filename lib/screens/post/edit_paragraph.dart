import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditParagraph1 extends StatefulWidget {
  const EditParagraph1({Key? key}) : super(key: key);

  @override
  State<EditParagraph1> createState() => _EditParagraph1State();
}

class _EditParagraph1State extends State<EditParagraph1> {
  @override
  Widget build(BuildContext context) {
    Paragraph currentParagraph = Provider.of<States>(context).currentParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    int paragraphIndex1 = Provider.of<States>(context).paragraphIndex1;
    Function updateParagraph1 = Provider.of<States>(context).updateParagraph1;
    Function deleteParagraph1 = Provider.of<States>(context).deleteParagraph1;


    TextEditingController firstVideoLinkC =
        TextEditingController(text: currentParagraph.firstVideo);
    TextEditingController firstImgLinkC =
        TextEditingController(text: currentParagraph.firstImg);
    TextEditingController leftImgLinkC =
        TextEditingController(text: currentParagraph.leftImg);
    TextEditingController paragraphC =
        TextEditingController(text: currentParagraph.paragraphText);
    TextEditingController rightImgLinkC =
        TextEditingController(text: currentParagraph.rightImg);
    TextEditingController lastImgLinkC =
        TextEditingController(text: currentParagraph.lastImg);
    TextEditingController lastVideoLinkC =
        TextEditingController(text: currentParagraph.lastVideo);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => {setIndexContent(1)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Paragraf Düzenle: '),
            IconButton(
                onPressed: () => {
                  deleteParagraph1(currentParagraph),
                  setIndexContent(1)
                },
                icon: const Icon(Icons.delete)),
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
            currentParagraph.firstVideo = firstVideoLinkC.text,
            currentParagraph.firstImg = firstImgLinkC.text,
            currentParagraph.leftImg = leftImgLinkC.text,
            currentParagraph.paragraphText = paragraphC.text,
            currentParagraph.rightImg = rightImgLinkC.text,
            currentParagraph.lastImg = lastImgLinkC.text,
            currentParagraph.lastVideo = lastVideoLinkC.text,
            updateParagraph1(currentParagraph, paragraphIndex1),
            setIndexContent(1),
          },
          child: const Text('Onayla'),
        ),
      ],
    );
  }
}
