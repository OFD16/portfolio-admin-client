import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:flutter/material.dart';

class States extends ChangeNotifier {
  int indexContent = 0;
  List<Paragraph> paragraphsList = [];
  List<Paragraph> paragraphsList1 = [];

  int paragraphIndex = 0;
  int paragraphIndex1 = 0;
  Paragraph currentParagraph = Paragraph();

  setCurrentParagraph(Paragraph paragraph){
    currentParagraph = paragraph;
    notifyListeners();
  }

  setCurrentIndex(int i){
    paragraphIndex = i;
    notifyListeners();
  }
  setCurrentIndex1(int i){
    paragraphIndex1 = i;
    notifyListeners();
  }

  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }

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
