class Paragraph {
  String? firstVideo;
  String? firstImg;
  String? leftImg;
  String? paragraphText;
  String? rightImg;
  String? lastImg;
  String? lastVideo;

  Paragraph(
      {this.firstVideo = " ",
      this.firstImg = " ",
      this.leftImg = " ",
      this.paragraphText = " ",
      this.rightImg = " ",
      this.lastImg = " ",
      this.lastVideo = " "});

  factory Paragraph.fromJson(Map<String, dynamic> json) => Paragraph(
    firstVideo: json["first_video"] as String,
    firstImg: json["first_image"] as String,
    leftImg: json["left_image"] as String,
    paragraphText: json["paragraph"] as String,
    rightImg: json["right_image"] as String,
    lastImg: json["last_image"] as String,
    lastVideo: json["last_video"] as String,
  );

  Map<String, dynamic> toJson() => {
    "first_video": firstVideo,
    "first_image": firstImg,
    "left_image": leftImg,
    "paragraph": paragraphText,
    "right_image": rightImg,
    "last_image": lastImg,
    "last_video": lastVideo,
  };
}
