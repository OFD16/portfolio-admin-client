import 'package:flutter/material.dart';

class ExperienceModal extends StatefulWidget {
  const ExperienceModal({Key? key}) : super(key: key);

  @override
  State<ExperienceModal> createState() => _ExperienceModalState();
}

class _ExperienceModalState extends State<ExperienceModal> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Tecrübe Ekle"),
      content: SizedBox(
        width: 400,
        height: 400,
      ),
    ) ;
  }
}
