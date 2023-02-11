class Medias {
  List<String>? videos;
  List<String>? images;

  Medias(
      {this.videos,
        this.images,
       });
  factory Medias.fromJson(Map<String, dynamic> json) => Medias(
    videos: json["videos"] as List<String>?,
    images: json["images"] as List<String>?,

  );

  Map<String, dynamic> toJson() => {
    "videos": videos,
    "images": images,
  };
}