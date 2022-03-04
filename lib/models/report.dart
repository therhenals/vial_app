// To parse this JSON data, do
//
//     final report = reportFromMap(jsonString);

import 'dart:convert';

import 'package:vial_app/models/signal_type.dart';

List<ReportModel> reportFromMap(String str) =>
    List<ReportModel>.from(json.decode(str).map((x) => ReportModel.fromMap(x)));

String reportToMap(List<ReportModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ReportModel {
  ReportModel({
    required this.id,
    required this.lat,
    required this.lng,
    required this.urlPhoto,
    required this.creationDate,
    required this.user,
    required this.signalType,
    required this.visibility,
    required this.conservation,
  });

  int id;
  String lat;
  String lng;
  String urlPhoto;
  DateTime creationDate;
  User user;
  SignalType signalType;
  Visibility visibility;
  Conservation conservation;

  factory ReportModel.fromMap(Map<String, dynamic> json) => ReportModel(
        id: json["id"],
        lat: json["lat"],
        lng: json["lng"],
        urlPhoto: json["urlPhoto"],
        creationDate: DateTime.parse(json["creationDate"]),
        user: User.fromMap(json["user"]),
        signalType: SignalType.fromMap(json["signalType"]),
        visibility: Visibility.fromMap(json["visibility"]),
        conservation: Conservation.fromMap(json["conservation"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "lat": lat,
        "lng": lng,
        "urlPhoto": urlPhoto,
        "creationDate": creationDate.toIso8601String(),
        "user": user.toMap(),
        "signalType": signalType.toMap(),
        "visibility": visibility.toMap(),
        "conservation": conservation.toMap(),
      };
}

class Conservation {
  Conservation({
    required this.id,
    required this.clean,
    required this.scratched,
    required this.foldedBoard,
    required this.bentPost,
  });

  int id;
  bool clean;
  bool scratched;
  bool foldedBoard;
  bool bentPost;

  factory Conservation.fromMap(Map<String, dynamic> json) => Conservation(
        id: json["id"],
        clean: json["clean"],
        scratched: json["scratched"],
        foldedBoard: json["foldedBoard"],
        bentPost: json["bentPost"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "clean": clean,
        "scratched": scratched,
        "foldedBoard": foldedBoard,
        "bentPost": bentPost,
      };
}

class User {
  User({
    required this.id,
    required this.firtsName,
    required this.secoundName,
    required this.surname,
    required this.secoundSurname,
    required this.username,
    required this.userPassword,
    required this.role,
    required this.creationDate,
  });

  int id;
  String firtsName;
  String secoundName;
  String surname;
  String secoundSurname;
  String username;
  String userPassword;
  String role;
  DateTime creationDate;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firtsName: json["firtsName"],
        secoundName: json["secoundName"],
        surname: json["surname"],
        secoundSurname: json["secoundSurname"],
        username: json["username"],
        userPassword: json["userPassword"],
        role: json["role"],
        creationDate: DateTime.parse(json["creationDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firtsName": firtsName,
        "secoundName": secoundName,
        "surname": surname,
        "secoundSurname": secoundSurname,
        "username": username,
        "userPassword": userPassword,
        "role": role,
        "creationDate": creationDate.toIso8601String(),
      };
}

class Visibility {
  Visibility({
    required this.id,
    required this.adequate,
    required this.vegetation,
    required this.color,
    required this.energyPost,
  });

  int id;
  bool adequate;
  bool vegetation;
  bool color;
  bool energyPost;

  factory Visibility.fromMap(Map<String, dynamic> json) => Visibility(
        id: json["id"],
        adequate: json["adequate"],
        vegetation: json["vegetation"],
        color: json["color"],
        energyPost: json["energyPost"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "adequate": adequate,
        "vegetation": vegetation,
        "color": color,
        "energyPost": energyPost,
      };
}
