class CompaniesModel {
  String? status;
  int? results;
  Data? data;

  CompaniesModel({this.status, this.results, this.data});

  CompaniesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Company>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Company>[];
      json['response'].forEach((v) {
        response!.add(Company.fromJson(v));
      });
    }
  }

}

class Company {
  String? specialty;
  String? location;
  String? photo;
  String? companyType;
  String? nationality;
  String? sId;
  String? nameInArabic;
  String? nameInEnglish;
  String? email;
  String? phone;
  String? createdAt;
  String? updatedAt;
  String? description;

  Company({
    this.specialty,
    this.location,
    this.companyType,
    this.nationality,
    this.sId,
    this.photo,
    this.nameInArabic,
    this.nameInEnglish,
    this.email,
    this.phone,
    this.createdAt,
    this.description,
    this.updatedAt
  });

  Company.fromJson(Map<String, dynamic> json) {
    specialty = json['specialty'];
    location = json['location'];
    companyType = json['companyType'];
    nationality = json['nationality'];
    sId = json['_id'];
    photo = json['photo'];
    nameInArabic = json['nameInArabic'];
    nameInEnglish = json['nameInEnglish'];
    email = json['email'];
    phone = json['phone'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
