import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';
import 'package:admin_client_portfolio/models/project_model.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';
import '../models/user_model.dart';

class States extends ChangeNotifier {
  User localUserData =  User(id: 0, firstName: "", lastName: "", age: 0, email: "", userImg: "", socialLinks: {}, introduction: "", medias: Medias(videos: [],images: []), markedProjects: [], markedBlogs: [], experiences: [], education: [], skills: [], role: "user");
  void setLocalUser(User user){
    localUserData = user;
  }

  List<Post> myPosts = [];
  void addPost (Post post){
    myPosts.add(post);
    notifyListeners();
  }
  void updatePost (Post post, int i){
    myPosts[i] = post;
    notifyListeners();
  }
  void deletePost(Post post){
    myPosts.remove(post);
    notifyListeners();
  }
  void clearPosts(){
    myPosts.clear();
    notifyListeners();
  }

  Post currentPost =  Post(id: 0, postName: "", postType: "", postTitle: "", introImg: "", postIntro: "", paragraphs: [], medias: Medias(), postOwner: 0, links: []);
  setCurrentPost(Post post){
    currentPost = post;
    notifyListeners();
  }
  int currentPostIndex = 0;
  setCurrentPostIndex(int i){
    currentPostIndex = i;
    notifyListeners();
  }

  List<Project> myProjects = [];
  void addProject (Project project){
    myProjects.add(project);
    notifyListeners();
  }
  void updateProject (Project project, int i){
    myProjects[i] = project;
    notifyListeners();
  }
  void deleteProject(Project project){
    myProjects.remove(project);
    notifyListeners();
  }
  void clearProjects(){
    myProjects.clear();
    notifyListeners();
  }

  Project currentProject = Project(id: 0, userID: 0, projectName: "", projectType: "", projectTitle: "", introImg: "", projectIntro: "", paragraphs: [], medias: Medias(), members: [], links: []);
  setCurrentProject(Project project){
    currentProject = project;
    notifyListeners();
  }
  int currentProjectIndex = 0;
  setCurrentProjectIndex(int i){
    currentProjectIndex = i;
    notifyListeners();
  }

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
  void clearMembers(){
    membersList.clear();
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
  void clearLinks(){
    linksList.clear();
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
  void clearPostLinks(){
    linksPostList.clear();
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
  void clearParagraphs(){
    paragraphsList.clear();
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
  void clearParagraphs1(){
    paragraphsList1.clear();
    notifyListeners();
  }

}
