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
  String userImg;
  Map<dynamic, String> socialLinks;
  String introduction;
  Medias medias;
  List<int> markedProjects;
  List<int> markedBlogs;
  List<Experience> experiences;
  List<Education> education;
  List<Skill> skills;
  String role;

  User(
      {
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.age,
        required this.email,
        required this.userImg,
        required this.socialLinks,
        required this.introduction,
        required this.medias,
        required this.markedProjects,
        required this.markedBlogs,
        required this.experiences,
        required this.education,
        required this.skills,
        required this.role,
      });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] as int,
    firstName: json["first_name"] as String,
    lastName: json["last_name"] as String,
    age: json["age"] as int,
    email: json["email"] as String,
    userImg: json["user_image"] as String,
    socialLinks: json["social_links"] as Map<dynamic, String>,
    introduction: json["introduction"] as String,
    medias: json["medias"] as Medias,
    markedProjects: json["marked_projects"] as List<int>,
    markedBlogs: json["marked_blogs"] as List<int>,
    experiences: json["experiences"] as List<Experience>,
    education: json["education"] as List<Education>,
    skills: json["skills"] as List<Skill>,
    role: json["role"] as String,
  );

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
