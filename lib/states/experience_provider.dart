
import 'package:flutter/material.dart';

import '../models/experience_model.dart';

class ExperienceProvider extends ChangeNotifier {
  List<Experience> experiences = [
    Experience(
        startedTime: "12 eylül 2020",
        finishedTime: "13 haziran 2020",
        companyName: "SOLVIO",
        jobName: "ömere basmak",
        introduction: "patır kütür basma keyfi",
        image: 'https://cdn-icons-png.flaticon.com/512/4526/4526587.png'),
    Experience(
        startedTime: "21 temmuz 2021",
        finishedTime: "31 aralık 2021",
        companyName: "CNN",
        jobName: "Polis",
        introduction: "Gizli görev",
        image: 'https://cdn-icons-png.flaticon.com/512/4526/4526587.png'),
  ];

  List<Experience> getExperiences (){
    return experiences;
  }

  void addExperience(Experience e){
    experiences.add(e);
    notifyListeners();
  }

  void setExperience(int i,String jobName,String companyName, String introduction, String imageUrl, String startedTime, String finishedTime){
    experiences[i].introduction=introduction;
    experiences[i].companyName=companyName;
    experiences[i].jobName=jobName;
    experiences[i].startedTime=startedTime;
    experiences[i].finishedTime=finishedTime;
    experiences[i].image=imageUrl;
    notifyListeners();
  }

  void deleteExperience(int e){
    experiences.remove(experiences[e]);
    notifyListeners();
  }

}