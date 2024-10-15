class HomeModel {
  String? status;
  int? results;
  Data? data;

  HomeModel({this.status, this.results, this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    results = json['results'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

}

class Data {
  List<HomeData>? response;

  Data({this.response});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['response'] != null) {
      response = <HomeData>[];
      json['response'].forEach((v) {
        response!.add(HomeData.fromJson(v));
      });
    }
  }

}

class HomeData {
  String? dates;
  String? details;
  String? organizer;
  String? locations;
  String? specialization;
  String? sId;
  String? fromHour;
  String? toHour;
  String? fromDate;
  String? toDate;
  String? registerInstructions;

  HomeData(
      {this.dates,
      this.details,
      this.organizer,
      this.locations,
      this.specialization,
      this.sId,
      this.fromHour,
      this.toHour,
      this.fromDate,
      this.toDate,
      this.registerInstructions});

  HomeData.fromJson(Map<String, dynamic> json) {
    dates = json['dates'];
    details = json['details'];
    organizer = json['organizer'];
    locations = json['locations'];
    specialization = json['specialization'];
    sId = json['_id'];
    fromHour = json['fromHour'];
    toHour = json['toHour'];
    fromDate = json['fromDate'];
    toDate = json['toDate'];
    registerInstructions = json['registerInstructions'];
  }

}
