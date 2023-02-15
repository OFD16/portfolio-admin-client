class Medias {
  List<String>? videos = [];
  List<String>? images = [];

  Medias({this.videos, this.images});

  factory Medias.fromJson(Map<String, dynamic> json) => Medias(
    videos: (json["videos"] is List<dynamic>)
        ? (json["videos"] as List<dynamic>).map((e) => e.toString()).toList()
        : [],
    images: (json["images"] is List<dynamic>)
        ? (json["images"] as List<dynamic>).map((e) => e.toString()).toList()
        : [],
  );

  Map<String, dynamic> toJson() => {
    "videos": videos,
    "images": images,
  };
}
