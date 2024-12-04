class AdsModel {
  String? status;
  int? results;
  Data? data;

  AdsModel({this.status, this.results, this.data});

  AdsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Ad>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Ad>[];
      json['response'].forEach((v) {
        response!.add(Ad.fromJson(v));
      });
    }
  }

}

class Ad {
  String? location;
  String? sId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Ad(
      {this.location, this.sId, this.image, this.createdAt, this.updatedAt});

  Ad.fromJson(Map<String, dynamic> json) {
    location = json['location'];
    sId = json['_id'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
