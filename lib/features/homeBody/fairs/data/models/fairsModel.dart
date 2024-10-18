class FairsModel {
  String? status;
  int? results;
  Data? data;

  FairsModel({this.status, this.results, this.data});

  FairsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<Fair>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <Fair>[];
      json['response'].forEach((v) {
        response!.add(new Fair.fromJson(v));
      });
    }
  }

}

class Fair {
  String? name;
  String? description;
  String? specialty;
  String? location;
  String? sId;
  String? date;
  String? photo;
  String? fairsLocation;
  String? fairStatus;

  Fair(
      {this.name,
      this.description,
      this.specialty,
      this.location,
      this.sId,
      this.date,
      this.photo,
      this.fairsLocation,
      this.fairStatus});

  Fair.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    specialty = json['specialty'];
    location = json['location'];
    sId = json['_id'];
    date = json['date'];
    photo = json['photo'];
    fairsLocation = json['fairsLocation'];
    fairStatus = json['fairStatus'];
  }

}
