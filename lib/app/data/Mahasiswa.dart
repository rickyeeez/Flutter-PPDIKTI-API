// To parse this JSON data, do
//
//     final mahasiswa = mahasiswaFromJson(jsonString);

import 'dart:convert';

Mahasiswa mahasiswaFromJson(String str) => Mahasiswa.fromJson(json.decode(str));

String mahasiswaToJson(Mahasiswa data) => json.encode(data.toJson());

class Mahasiswa {
  List<MahasiswaElement> mahasiswa;

  Mahasiswa({
    required this.mahasiswa,
  });

  factory Mahasiswa.fromJson(Map<String, dynamic> json) => Mahasiswa(
    mahasiswa: List<MahasiswaElement>.from(json["mahasiswa"].map((x) => MahasiswaElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "mahasiswa": List<dynamic>.from(mahasiswa.map((x) => x.toJson())),
  };
}

class MahasiswaElement {
  String text;
  String websiteLink;

  MahasiswaElement({
    required this.text,
    required this.websiteLink,
  });

  factory MahasiswaElement.fromJson(Map<String, dynamic> json) => MahasiswaElement(
    text: json["text"],
    websiteLink: json["website-link"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "website-link": websiteLink,
  };
}
