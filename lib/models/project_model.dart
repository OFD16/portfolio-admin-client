
import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';

class Project {
  int? id;
  int userID;
  String projectName;
  String projectType;
  String projectTitle;
  String introImg;
  String projectIntro;
  List<Paragraph> paragraphs;
  Medias? medias;
  List<String>? members;
  List<String>? links;
  String? createdAt;
  String? updatedAt;


  Project(
      {
        this.id,
        required this.userID,
        required this.projectName,
        required this.projectType,
        required this.projectTitle,
        required this.introImg,
        required this.projectIntro,
        required this.paragraphs,
        this.medias,
        this.members,
        this.links,
        this.createdAt,
        this.updatedAt,
});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"] as int?,
    userID: json["user_id"] as int,
    projectName: json["project_name"] as String,
    projectType: json["project_type"] as String,
    projectTitle: json["project_title"] as String,
    introImg: json["intro_image"] as String,
    projectIntro: json["project_intro"] as String,
    paragraphs: (json["paragraphs"] as List).map((item) => Paragraph.fromJson(item)).toList(),
    medias: json["medias"] == null ? null : Medias.fromJson(json["medias"] as Map<String, dynamic>),
    members: (json["links"] is List<dynamic>)
        ? (json["links"] as List<dynamic>).map((e) => e.toString()).toList()
        : [],
    links: (json["links"] is List<dynamic>)
        ? (json["links"] as List<dynamic>).map((e) => e.toString()).toList()
        : [],
    createdAt: json["created_at"] as String?,
    updatedAt: json["updated_at"] as String?,
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "user_id": userID,
    "project_name": projectName,
    "project_type": projectType,
    "project_title": projectTitle,
    "intro_image": introImg,
    "project_intro": projectIntro,
    "paragraphs": paragraphs,
    "medias": medias,
    "members": members,
    "links": links,
    /*"created_at": createdAt,
    "updated_at": updatedAt,*/
  };
}
