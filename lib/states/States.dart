import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:flutter/material.dart';

class States extends ChangeNotifier {
  int indexContent = 0;
  List<Paragraph> paragraphsList = [];

  Paragraph paragraphInstance = Paragraph();

  setParagraphInstance(Paragraph paragraph){
    paragraphInstance = paragraph;
  }
  clearParagraphInstance(){
    paragraphInstance.firstVideo = "";
    paragraphInstance.firstImg = "";
    paragraphInstance.leftImg = "";
    paragraphInstance.paragraphText = "";
    paragraphInstance.rightImg = "";
    paragraphInstance.lastImg = "";
    paragraphInstance.lastVideo = "";
  }

  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }

  void addParagraph(Paragraph paragraph){
    paragraphsList.add(paragraph);
    notifyListeners();
  }
  void deleteParagraph(Paragraph paragraph){
    paragraphsList.remove(paragraph);
    notifyListeners();
  }
}
