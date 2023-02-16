import 'package:admin_client_portfolio/models/education_model.dart';
import 'package:admin_client_portfolio/models/experience_model.dart';
import 'package:admin_client_portfolio/models/medias_model.dart';
import 'package:admin_client_portfolio/models/skill_model.dart';

class User {
  int id;
  String firstName;
  String lastName;
  int age;
  String email;
  String? userImg;
  Map<dynamic, String>? socialLinks;
  String introduction;
  Medias? medias;
  List<int> markedProjects;
  List<int> markedBlogs;
  List<Experience>? experiences;
  List<Education>? education;
  List<Skill>? skills;
  String role;

  User(
      {
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.age,
        required this.email,
        required this.userImg,
        this.socialLinks,
        required this.introduction,
        this.medias,
        required this.markedProjects,
        required this.markedBlogs,
        this.experiences,
        this.education,
        this.skills,
        required this.role,
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
      userImg: json['user_image'] as String?,
      socialLinks: json['social_links'] != null
          ? Map<dynamic, String>.from(json['social_links'])
          : null,
      introduction: json['introduction'] as String,
      medias: json['medias'] != null ? Medias.fromJson(json['medias']) : null,
      markedProjects: List<int>.from(json['marked_projects']),
      markedBlogs: List<int>.from(json['marked_blogs']),
      experiences: json['experiences'] != null
          ? List<Experience>.from(
          json['experiences'].map((e) => Experience.fromJson(e)))
          : null,
      education: json['education'] != null
          ? List<Education>.from(
          json['education'].map((e) => Education.fromJson(e)))
          : null,
      skills: json['skills'] != null
          ? List<Skill>.from(json['skills'].map((e) => Skill.fromJson(e)))
          : null,
      role: json['role'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "age": age,
    "email": email,
    "userImg": userImg,
    "social_links": socialLinks,
    "introduction": introduction,
    "medias": medias,
    "marked_projects": markedProjects,
    "marked_blogs": markedBlogs,
    "experiences": experiences,
    "education": education,
    "skills": skills,
    "role": role,
  };
}
