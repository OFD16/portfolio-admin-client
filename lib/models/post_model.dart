import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/paragraph_model.dart';

class Post {
  int id;
  int postOwner;
  String postName;
  String postType;
  String postTitle;
  String introImg;
  String postIntro;
  List<Paragraph> paragraphs;
  Medias? medias;
  List<String> links;
  String? createdAt;
  String? updatedAt;

  Post(
      {
        required this.id,
        required this.postOwner,
        required this.postName,
        required this.postType,
        required this.postTitle,
        required this.introImg,
        required this.postIntro,
        required this.paragraphs,
        this.medias,
        required this.links,
        this.createdAt,
        this.updatedAt
      });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["id"] as int,
    postOwner: json["user_id"] as int,
    postName: json["post_name"] as String,
    postType: json["post_type"] as String,
    postTitle: json["post_title"] as String,
    introImg: json["intro_image"] as String,
    postIntro: json["post_intro"] as String,
    paragraphs: (json["paragraphs"] as List).map((item) => Paragraph.fromJson(item)).toList(),
    medias: Medias.fromJson(json["medias"] as Map<String, dynamic>),
    links: (json["links"] is List<dynamic>)
        ? (json["links"] as List<dynamic>).map((e) => e.toString()).toList()
        : [],
    createdAt: json["created_at"] as String?,
    updatedAt: json["updated_at"] as String?,
  );

  Map<String, dynamic> toJson() => {
    //"id": id,
    "user_id": postOwner,
    "post_name": postName,
    "post_type": postType,
    "post_title": postTitle,
    "intro_image": introImg,
    "post_intro": postIntro,
    "paragraphs": paragraphs,
    "medias": medias,
    "links": links,
    /*"created_at": createdAt,
    "updated_at": updatedAt,*/
  };
}