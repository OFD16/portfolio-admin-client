import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:flutter/material.dart';

import '../models/paragraph_model.dart';
import '../models/project_model.dart';

class ProjectStates extends ChangeNotifier {
  ///Project Create
  List<Paragraph> paragraphsList = [];
  void addParagraph(Paragraph paragraph){
    paragraphsList.add(paragraph);
    notifyListeners();
  }
  void updateParagraph(Paragraph paragraph, int i){
    paragraphsList[i] = paragraph;
    notifyListeners();
  }
  void deleteParagraph(Paragraph paragraph){
    paragraphsList.remove(paragraph);
    notifyListeners();
  }
  void clearParagraphs(){
    paragraphsList.clear();
    notifyListeners();
  }
  int paragraphIndexC = 0;
  setCurrentIndexC(int i){
    paragraphIndexC = i;
    notifyListeners();
  }
  Paragraph currentParagraph = Paragraph();
  setCurrentParagraph(Paragraph paragraph){
    currentParagraph = paragraph;
    notifyListeners();
  }

  ///Project Edit & Paragraph Create & Edit
  int currentProjectIndex = 0;
  setCurrentProjectIndex(int i){
    currentProjectIndex = i;
    notifyListeners();
  }
  Project currentProject = Project(id:0, userID: 0, projectName: '', projectType: '', projectTitle: '', introImg: '', projectIntro: '', members: [], medias: Medias(images: [],videos: []), paragraphs: [], links: []);
  setCurrentProject(Project project){
    currentProject = project;
    notifyListeners();
  }
  int paragraphIndex = 0;
  void setCurrentParagraphIndex(int i){
    paragraphIndex = i;
    notifyListeners();
  }
  void addParagraphTOProject(Paragraph paragraph){
    currentProject.paragraphs.add(paragraph);
  }
  void updateParagraphTOProject(Paragraph paragraph, int index){
    currentProject.paragraphs[index] = paragraph;
  }
  void deleteParagraphTOProject(Paragraph paragraph){
    currentProject.paragraphs.remove(paragraph);
  }
  List<String> currentProjectMembers = [];
  void setCurrentProjectMembers(List<String> members){
    currentProjectMembers = members;
    notifyListeners();
  }
  void clearProjectMembers(){
    currentProjectMembers.clear();
    notifyListeners();
  }
  void addProjectMember (String member){
    currentProjectMembers.add(member);
    notifyListeners();
  }
  void updateProjectMember (String member, int i){
    currentProjectMembers[i] = member;
    notifyListeners();
  }
  void deleteProjectMember(String member){
    currentProjectMembers.remove(member);
    notifyListeners();
  }
  List<String> currentProjectLinks = [];
  void setCurrentProjectLinks(List<String> links){
    currentProjectLinks = links;
    notifyListeners();
  }
  void clearProjectLinks(){
    currentProjectLinks.clear();
    notifyListeners();
  }
  void addProjectLink (String link){
    currentProjectLinks.add(link);
    notifyListeners();
  }
  void updateProjectLink (String link, int i){
    currentProjectLinks[i] = link;
    notifyListeners();
  }
  void deleteProjectLink(String link){
    currentProjectLinks.remove(link);
    notifyListeners();
  }
}