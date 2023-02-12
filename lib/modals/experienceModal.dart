import 'dart:async';

import 'package:admin_client_portfolio/states/experience_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/experience_model.dart';

class ExperienceModal extends StatefulWidget {
  final int? index;

  const ExperienceModal({
    Key? key,
    this.index,
  }) : super(key: key);

  @override
  State<ExperienceModal> createState() => _ExperienceModalState();
}

class _ExperienceModalState extends State<ExperienceModal> {
  TextEditingController _jobNameController = TextEditingController();
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _startTimeController = TextEditingController();
  TextEditingController _endTimeController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _introductionController = TextEditingController();
  bool isEmpty = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) isEmpty = false;

  }

  @override
  Widget build(BuildContext context) {
    int index = isEmpty ?  -1 : widget.index!;
    List eList =  Provider.of<ExperienceProvider>(context).getExperiences();
    if(index > -1){
      _jobNameController.text = eList[index].jobName!;
      _companyNameController.text = eList[index].companyName!;
      _startTimeController.text = eList[index].startedTime!;
      _endTimeController.text = eList[index].finishedTime!;
      _imageUrlController.text = eList[index].image!;
      _introductionController.text = eList[index].introduction!  ;
    }

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Tecrübe Ekle"),
          isEmpty
              ? Container()
              : IconButton(
                  onPressed: () {
                    Timer(Duration(milliseconds: 150), () {Provider.of<ExperienceProvider>(context, listen: false)
                        .deleteExperience(widget.index!); });
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.delete))
        ],
      ),
      content: Container(
        width: 400,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _jobNameController,
                    decoration: const InputDecoration(
                        labelText: "İş Adı",
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: TextField(
                    controller: _companyNameController,
                    decoration: const InputDecoration(
                        labelText: "Şirket Adı",
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _startTimeController,
                    decoration: const InputDecoration(
                        labelText: "Başlama Zamanı",
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: TextField(
                    controller: _endTimeController,
                    decoration: const InputDecoration(
                        labelText: "Bitiş Zamanı",
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    maxLines: 5,
                    controller: _introductionController,
                    decoration: const InputDecoration(
                        labelText: "Açıklama",
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                    labelText: "Resim URL",
                    labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  if (isEmpty) {
                    Provider.of<ExperienceProvider>(context, listen: false)
                        .addExperience(Experience(
                            startedTime: _startTimeController.text,
                            finishedTime: _endTimeController.text,
                            companyName: _companyNameController.text,
                            jobName: _jobNameController.text,
                            introduction: _introductionController.text,
                            image: _imageUrlController.text));
                    Navigator.pop(context);
                  }
                  else {
                    Provider.of<ExperienceProvider>(context, listen: false)
                        .setExperience(
                            index,
                            _jobNameController.text,
                            _companyNameController.text,
                            _introductionController.text,
                            _imageUrlController.text,
                            _startTimeController.text,
                            _endTimeController.text);
                    Navigator.pop(context);
                  }
                },
                child: Text("Kaydet"))
          ],
        ),
      ),
    );
  }
}
