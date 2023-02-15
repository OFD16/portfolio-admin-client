import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateParagraph extends StatefulWidget {
  const CreateParagraph({Key? key}) : super(key: key);

  @override
  State<CreateParagraph> createState() => _CreateParagraphState();
}

class _CreateParagraphState extends State<CreateParagraph> {
  @override
  Widget build(BuildContext context) {
    Paragraph currentParagraph = Provider.of<States>(context).currentParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    Function addParagraph = Provider.of<States>(context).addParagraph;

    TextEditingController firstVideoLinkC =
        TextEditingController(text: currentParagraph.firstVideo);
    TextEditingController firstImgLinkC =
        TextEditingController(text: currentParagraph.firstImg);
    TextEditingController leftImgLinkC =
        TextEditingController(text: currentParagraph.leftImg);
    TextEditingController paragraphC =
        TextEditingController(text: currentParagraph.paragraph);
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
                onPressed: () => {setIndexContent(3)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Paragraf Oluştur: '),
            const SizedBox(),
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
            currentParagraph.paragraph = paragraphC.text,
            currentParagraph.rightImg = rightImgLinkC.text,
            currentParagraph.lastImg = lastImgLinkC.text,
            currentParagraph.lastVideo = lastVideoLinkC.text,
            addParagraph(currentParagraph),
            setIndexContent(3),
          },
          child: const Text('Onayla'),
        ),
      ],
    );
  }
}
