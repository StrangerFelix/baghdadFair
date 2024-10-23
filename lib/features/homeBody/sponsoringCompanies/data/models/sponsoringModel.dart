class SponsorsModel {
  String? status;
  int? results;
  Data? data;

  SponsorsModel({this.status, this.results, this.data});

  SponsorsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Sponsor>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Sponsor>[];
      json['response'].forEach((v) {
        response!.add(Sponsor.fromJson(v));
      });
    }
  }

}

class Sponsor {
  String? sId;
  String? image;
  String? sponsorType;
  String? createdAt;
  String? updatedAt;

  Sponsor(
      {this.sId, this.image, this.sponsorType, this.createdAt, this.updatedAt});

  Sponsor.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    image = json['image'];
    sponsorType = json['sponsorType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
