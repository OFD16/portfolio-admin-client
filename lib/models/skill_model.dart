class Skill {
  String? skillName;
  String? experienceTime;
  String? description;
  String? image;

  Skill(
      {this.skillName,
        this.experienceTime,
        this.description,
        this.image,
      });
  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    skillName: json["skill_name"] as String?,
    experienceTime: json["experience_time"] as String?,
    description: json["description"] as String?,
    image: json["image"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "skill_name": skillName,
    "experience_time": experienceTime,
    "description": description,
    "image": image,
  };
}