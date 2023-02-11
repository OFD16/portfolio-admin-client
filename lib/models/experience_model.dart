class Experience {
  String? startedTime;
  String? finishedTime;
  String? companyName;
  String? jobName;
  String? introduction;
  String? image;

  Experience(
      { required this.startedTime,
        required this.finishedTime,
        required this.companyName,
        required this.jobName,
        required this.introduction,
        required this.image,
      });
  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    startedTime: json["started_time"] as String?,
    finishedTime: json["finished_time"] as String?,
    companyName: json["company_name"] as String?,
    jobName: json["job_name"] as String?,
    introduction: json["introduction"] as String?,
    image: json["image"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "started_time": startedTime,
    "finished_time": finishedTime,
    "company_name": companyName,
    "job_name": jobName,
    "introduction": introduction,
    "image": image,
  };
}