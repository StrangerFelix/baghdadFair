class CompaniesGuideModel {
  String? status;
  int? results;
  Data? data;

  CompaniesGuideModel({this.status, this.results, this.data});

  CompaniesGuideModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Guide>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Guide>[];
      json['response'].forEach((v) {
        response!.add(Guide.fromJson(v));
      });
    }
  }

}

class Guide {
  String? companyName;
  String? description;
  String? location;
  String? sId;
  String? email;
  String? phone;
  String? photo;
  String? companyType;
  String? createdAt;
  String? updatedAt;

  Guide(
      {this.companyName,
      this.description,
      this.location,
      this.sId,
      this.email,
      this.phone,
      this.photo,
      this.companyType,
      this.createdAt,
      this.updatedAt});

  Guide.fromJson(Map<String, dynamic> json) {
    companyName = json['companyName'];
    description = json['description'];
    location = json['location'];
    sId = json['_id'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    companyType = json['companyType'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
