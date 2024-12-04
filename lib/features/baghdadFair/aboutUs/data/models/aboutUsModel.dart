class AboutUsModel {
  String? status;
  int? results;
  Data? data;

  AboutUsModel({this.status, this.results, this.data});

  AboutUsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<AboutUs>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <AboutUs>[];
      json['response'].forEach((v) {
        response!.add(AboutUs.fromJson(v));
      });
    }
  }


}

class AboutUs {
  String? description;
  String? sId;

  AboutUs({this.description, this.sId});

  AboutUs.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    sId = json['_id'];
  }


}
