import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/states/States.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ParagraphPage extends StatefulWidget {
  const ParagraphPage({Key? key}) : super(key: key);

  @override
  State<ParagraphPage> createState() => _ParagraphPageState();
}

TextEditingController firstVideoLinkC = TextEditingController();
TextEditingController firstImgLinkC = TextEditingController();
TextEditingController leftImgLinkC = TextEditingController();
TextEditingController paragraphC = TextEditingController();
TextEditingController rightImgLinkC = TextEditingController();
TextEditingController lastImgLinkC = TextEditingController();
TextEditingController lastVideoLinkC = TextEditingController();

class _ParagraphPageState extends State<ParagraphPage> {
  @override
  Widget build(BuildContext context) {
    final Paragraph paragraphInstance = Paragraph();
    Function addParagraph = Provider.of<States>(context).addParagraph;
    Function setIndexContent = Provider.of<States>(context).setIndexContent;
    return ListView(
      children: [
        Text('Paragraf: '),
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
            print('paragraf: ${paragraphInstance.paragraphText}'),
            paragraphInstance.paragraphText = paragraphC.text,
            print('paragraf: ${paragraphInstance.paragraphText}'),
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
