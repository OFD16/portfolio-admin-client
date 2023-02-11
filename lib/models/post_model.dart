import 'dart:ui';

import 'package:admin_client_portfolio/models/medias_model.dart';

class Post {
  int id;
  String postName;
  String postType;
  String postTitle;
  String introImg;
  String postIntro;
  List<Paragraph> paragraphs;
  Medias medias;
  int postOwner;
  List<String> links;

  Post(
      {
        required this.id,
        required this.postName,
        required this.postType,
        required this.postTitle,
        required this.introImg,
        required this.postIntro,
        required this.paragraphs,
        required this.medias,
        required this.postOwner,
        required this.links,
      });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"] as int,
    postName: json["post_name"] as String,
    postType: json["post_type"] as String,
    postTitle: json["post_title"] as String,
    introImg: json["intro_image"] as String,
    postIntro: json["post_intro"] as String,
    paragraphs: json["paragraphs"] as List<Paragraph>,
    medias: json["medias"] as Medias,
    postOwner: json["post_owner"] as int,
    links: json["links"] as List<String>,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "post_name": postName,
    "post_type": postType,
    "post_title": postTitle,
    "intro_image": introImg,
    "post_intro": postIntro,
    "paragraphs": paragraphs,
    "medias": medias,
    "post_owner": postOwner,
    "links": links,
  };
}