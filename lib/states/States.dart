import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:flutter/material.dart';

class States extends ChangeNotifier {

  List<String> membersList = [];
  void addMember (String memberName){
    membersList.add(memberName);
    notifyListeners();
  }
  void updateMember (String memberName, int i){
    membersList[i] = memberName;
    notifyListeners();
  }
  void deleteMember(String memberName){
    membersList.remove(memberName);
    notifyListeners();
  }

  List<String> linksList = [];
  void addLink (String link){
    linksList.add(link);
    notifyListeners();
  }
  void updateLink (String link, int i){
    linksList[i] = link;
    notifyListeners();
  }
  void deleteLink(String link){
    linksList.remove(link);
    notifyListeners();
  }

  List<String> linksPostList = [];
  void addPostLink (String link){
    linksPostList.add(link);
    notifyListeners();
  }
  void updatePostLink (String link, int i){
    linksPostList[i] = link;
    notifyListeners();
  }
  void deletePostLink(String link){
    linksPostList.remove(link);
    notifyListeners();
  }

  Paragraph currentParagraph = Paragraph();
  setCurrentParagraph(Paragraph paragraph){
    currentParagraph = paragraph;
    notifyListeners();
  }

  int paragraphIndex = 0;
  setCurrentIndex(int i){
    paragraphIndex = i;
    notifyListeners();
  }

  int paragraphIndex1 = 0;
  setCurrentIndex1(int i){
    paragraphIndex1 = i;
    notifyListeners();
  }

  int indexContent = 0;
  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }

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

  List<Paragraph> paragraphsList1 = [];
  void addParagraph1(Paragraph paragraph){
    paragraphsList1.add(paragraph);
    notifyListeners();
  }
  void updateParagraph1(Paragraph paragraph, int i){
    paragraphsList1[i] = paragraph;
    notifyListeners();
  }
  void deleteParagraph1(Paragraph paragraph){
    paragraphsList1.remove(paragraph);
    notifyListeners();
  }

}
