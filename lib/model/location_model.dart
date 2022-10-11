// To parse this JSON data, do
//
//     final locationModel = locationModelFromJson(jsonString);

import 'dart:convert';

List<LocationModel> locationModelFromJson(String str) =>
    List<LocationModel>.from(
        json.decode(str).map((x) => LocationModel.fromJson(x)));

String locationModelToJson(List<LocationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LocationModel {
  LocationModel(
      {required this.branchId,
      required this.name,
      required this.distance,
      required this.address});

  int branchId;
  String name;
  double distance;
  String address;

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      branchId: json["branchId"],
      name: json["name"],
      distance: json["distance"].toDouble(),
      address: json["address"]);

  Map<String, dynamic> toJson() => {
        "branchId": branchId,
        "name": name,
        "distance": distance,
        "address": address
      };
}
