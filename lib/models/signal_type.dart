import 'dart:convert';

List<SignalType> signalTypeFromMap(String str) =>
    List<SignalType>.from(json.decode(str).map((x) => SignalType.fromMap(x)));

String signalTypeToMap(List<SignalType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SignalType {
  SignalType({
    required this.id,
    required this.name,
  });

  int id;
  String name;

  factory SignalType.fromMap(Map<String, dynamic> json) => SignalType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
      };
}
