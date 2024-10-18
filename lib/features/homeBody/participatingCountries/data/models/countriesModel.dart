class CountriesModel {
  String? status;
  int? results;
  Data? data;

  CountriesModel({this.status, this.results, this.data});

  CountriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Country>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Country>[];
      json['response'].forEach((v) {
        response!.add( Country.fromJson(v));
      });
    }
  }

}

class Country {
  String? name;
  String? sId;
  String? flag;
  String? createdAt;
  String? updatedAt;

  Country({this.name, this.sId, this.flag, this.createdAt, this.updatedAt});

  Country.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    sId = json['_id'];
    flag = json['flag'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

}
