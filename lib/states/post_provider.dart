import 'package:flutter/material.dart';

import '../models/medias_model.dart';
import '../models/paragraph_model.dart';
import '../models/post_model.dart';

class PostStates extends ChangeNotifier {
  ///Post Create
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

  ///Post Edit & Paragraph Create & Edit
  int currentPostIndex = 0;
  setCurrentPostIndex(int i){
    currentPostIndex = i;
    notifyListeners();
  }
  Post currentPost =  Post(id: 0, postName: "", postType: "", postTitle: "", introImg: "", postIntro: "", paragraphs: [], medias: Medias(), postOwner: 0, links: []);
  setCurrentPost(Post post){
    currentPost = post;
    notifyListeners();
  }
  int paragraphIndex = 0;
  void setCurrentParagraphIndex(int i){
    paragraphIndex = i;
    notifyListeners();
  }
  void addParagraphTOPost(Paragraph paragraph){
    currentPost.paragraphs.add(paragraph);
  }
  void updateParagraphTOPost(Paragraph paragraph, int index){
    currentPost.paragraphs[index] = paragraph;
  }
  void deleteParagraphTOPost(Paragraph paragraph){
    currentPost.paragraphs.remove(paragraph);
  }
  List<String> currentPostLinks = [];
  void setCurrentPostLinks(List<String> links){
    currentPostLinks = links;
    notifyListeners();
  }
  void clearPostLinks(){
    currentPostLinks.clear();
    notifyListeners();
  }
  void addPostLink (String link){
    currentPostLinks.add(link);
    notifyListeners();
  }
  void updatePostLink (String link, int i){
    currentPostLinks[i] = link;
    notifyListeners();
  }
  void deletePostLink(String link){
    currentPostLinks.remove(link);
    notifyListeners();
  }
}