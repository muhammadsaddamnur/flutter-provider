// To parse this JSON data, do
//
//     final postAll = postAllFromJson(jsonString);

import 'dart:convert';

List<PostAll> postAllFromJson(String str) =>
    new List<PostAll>.from(json.decode(str).map((x) => PostAll.fromJson(x)));

String postAllToJson(List<PostAll> data) =>
    json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));

class PostAll {
  int userId;
  int id;
  String title;
  String body;

  PostAll({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostAll.fromJson(Map<String, dynamic> json) => new PostAll(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
