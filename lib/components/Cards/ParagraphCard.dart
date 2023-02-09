import 'package:admin_client_portfolio/components/Cards/ImageCard.dart';
import 'package:flutter/material.dart';

class ParagraphCard extends StatefulWidget {
  const ParagraphCard({Key? key}) : super(key: key);

  @override
  State<ParagraphCard> createState() => _ParagraphCardState();
}
final TextEditingController firstVideoController = TextEditingController();
final TextEditingController paragraphController = TextEditingController();
final TextEditingController lastVideoController = TextEditingController();
class _ParagraphCardState extends State<ParagraphCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //first_video
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Video linki",
            hintText: "Yazının üstüne koymak isterseniz linki yapıştırınız...",
          ),
          controller: firstVideoController,
        ),
        const SizedBox(height: 8),
        //first_image
        ImageCard(()=>{}),
        const SizedBox(height: 8),
        Row(
          children: [
            //leftImage
            Expanded(
              flex: 1,
              child: ImageCard(()=>{}),
            ),
            const SizedBox(width: 8),
            Expanded(
              flex: 2,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: "Paragraf: ",
                  hintText:
                      "Asıl Yazı...",
                ),
                controller: paragraphController,
              ),
            ),
            const SizedBox(width: 8),
            //RightImage
            Expanded(
              flex: 1,
              child: ImageCard(()=>{}),
            ),
          ],
        ),
        //lastImage
        const SizedBox(height: 8),
        ImageCard(()=>{}),
        const SizedBox(height: 8),
        //last_video
        TextFormField(
          decoration: const InputDecoration(
            labelText: "Video linki 2",
            hintText: "Yazının altına koymak isterseniz linki yapıştırınız...",
          ),
          controller: lastVideoController,
        ),
      ],
    );
  }
}
