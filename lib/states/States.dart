import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:flutter/material.dart';

class States extends ChangeNotifier {
  int indexContent = 0;
  List paragraphsList =[];

  void setIndexContent(int index) {
    indexContent = index;
    notifyListeners();
  }

  void addParagraph(Paragraph paragraph){
    paragraphsList.add(paragraph);
    notifyListeners();
  }
}
