import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/post_provider.dart';

class EditParagraph1 extends StatefulWidget {
  const EditParagraph1({Key? key}) : super(key: key);

  @override
  State<EditParagraph1> createState() => _EditParagraph1State();
}

class _EditParagraph1State extends State<EditParagraph1> {
  @override
  Widget build(BuildContext context) {
    int lastIndexContent = Provider.of<States>(context).lastIndexContent;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;

    Paragraph currentParagraph = Provider.of<PostStates>(context).currentParagraph;
    int paragraphIndex = Provider.of<PostStates>(context).paragraphIndex;
    Function updateParagraphTOPost = Provider.of<PostStates>(context).updateParagraphTOPost;
    Function deleteParagraphTOPost = Provider.of<PostStates>(context).deleteParagraphTOPost;


    TextEditingController firstVideoLinkC = TextEditingController(text: currentParagraph.firstVideo);
    TextEditingController firstImgLinkC = TextEditingController(text: currentParagraph.firstImg);
    TextEditingController leftImgLinkC = TextEditingController(text: currentParagraph.leftImg);
    TextEditingController paragraphC = TextEditingController(text: currentParagraph.paragraph);
    TextEditingController rightImgLinkC = TextEditingController(text: currentParagraph.rightImg);
    TextEditingController lastImgLinkC = TextEditingController(text: currentParagraph.lastImg);
    TextEditingController lastVideoLinkC = TextEditingController(text: currentParagraph.lastVideo);

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () => {setIndexContent(lastIndexContent)},
                icon: const Icon(Icons.arrow_back)),
            const Text('Paragraf Düzenle: '),
            IconButton(
                onPressed: () => {
                  deleteParagraphTOPost(currentParagraph),
                  setIndexContent(lastIndexContent),
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
            currentParagraph.paragraph = paragraphC.text,
            currentParagraph.rightImg = rightImgLinkC.text,
            currentParagraph.lastImg = lastImgLinkC.text,
            currentParagraph.lastVideo = lastVideoLinkC.text,
            updateParagraphTOPost(currentParagraph, paragraphIndex),
            setIndexContent(lastIndexContent),
          },
          child: const Text('Onayla'),
        ),
      ],
    );
  }
}
