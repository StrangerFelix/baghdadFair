class NewsModel {
  String? status;
  int? results;
  Data? data;

  NewsModel({this.status, this.results, this.data});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<News>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <News>[];
      json['response'].forEach((v) {
        response!.add(News.fromJson(v));
      });
    }
  }

}

class News {
  String? title;
  String? description;
  String? details;
  String? sId;
  String? photo;
  String? date;
  String? createdAt;
  String? updatedAt;

  News(
      {this.title,
      this.description,
      this.details,
      this.sId,
      this.photo,
      this.date,
      this.createdAt,
      this.updatedAt});

  News.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    details = json['details'];
    sId = json['_id'];
    photo = json['photo'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
