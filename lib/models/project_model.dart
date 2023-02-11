import 'dart:ui';

import 'package:admin_client_portfolio/models/medias_model.dart';

class Project {
  int id;
  String projectName;
  String projectType;
  String projectTitle;
  String introImg;
  String projectIntro;
  List<Paragraph> paragraphs;
  Medias medias;
  List<String> members;
  List<String> links;

  Project(
      {
        required this.id,
        required this.projectName,
        required this.projectType,
        required this.projectTitle,
        required this.introImg,
        required this.projectIntro,
        required this.paragraphs,
        required this.medias,
        required this.members,
        required this.links,
});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"] as int,
    projectName: json["project_name"] as String,
    projectType: json["project_type"] as String,
    projectTitle: json["project_title"] as String,
    introImg: json["intro_image"] as String,
    projectIntro: json["project_intro"] as String,
    paragraphs: json["paragraphs"] as List<Paragraph>,
    medias: json["medias"] as Medias,
    members: json["members"] as List<String>,
    links: json["links"] as List<String>,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "project_name": projectName,
    "project_type": projectType,
    "project_title": projectTitle,
    "intro_image": introImg,
    "project_intro": projectIntro,
    "paragraphs": paragraphs,
    "medias": medias,
    "members": members,
    "links": links,
  };
}
