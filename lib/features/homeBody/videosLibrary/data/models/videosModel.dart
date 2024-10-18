class VideosModel {
  String? status;
  int? results;
  Data? data;

  VideosModel({this.status, this.results, this.data});

  VideosModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Video>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Video>[];
      json['response'].forEach((v) {
        response!.add(Video.fromJson(v));
      });
    }
  }

}

class Video {
  String? title;
  String? classification;
  String? description;
  String? sId;
  String? link;
  String? createdAt;
  String? updatedAt;

  Video(
      {this.title,
      this.classification,
      this.description,
      this.sId,
      this.link,
      this.createdAt,
      this.updatedAt});

  Video.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    classification = json['classification'];
    description = json['description'];
    sId = json['_id'];
    link = json['link'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
