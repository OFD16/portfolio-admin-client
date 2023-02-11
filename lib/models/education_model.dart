class Education {
  String? startedTime;
  String? finishedTime;
  String? schoolName;
  String? degree;
  String? image;

  Education(
      {this.startedTime,
        this.finishedTime,
        this.schoolName,
        this.degree,
        this.image,
      });
  factory Education.fromJson(Map<String, dynamic> json) => Education(
    startedTime: json["started_time"] as String?,
    finishedTime: json["finished_time"] as String?,
    schoolName: json["school_name"] as String?,
    degree: json["degree"] as String?,
    image: json["image"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "started_time": startedTime,
    "finished_time": finishedTime,
    "school_name": schoolName,
    "degree": degree,
    "image": image,
  };
}